package db;

import com.db4o.*;
import com.db4o.config.*;
import com.db4o.ext.Db4oUUID;
import com.db4o.extras.autoincrement.*;
import com.db4o.ta.*;
import java.util.*;

public class Database {
    public static ObjectContainer odb;

    public static synchronized void init(String dbname){
        // config
        EmbeddedConfiguration config = Db4oEmbedded.newConfiguration();
        config.file().generateUUIDs(ConfigScope.GLOBALLY);
        config.common().add(new TransparentActivationSupport());

        if(odb != null) odb.close();
        odb = Db4oEmbedded.openFile(config, dbname);
        //AutoIncrementSupport.install(odb);
    }

    public static synchronized void save(DbObject obj){
        if(obj.getId() == 0){
            ObjectSet result = odb.query(DbObject.class);
            int max = 0;

            Iterator<DbObject> it = result.iterator();

            while(it.hasNext()){
                DbObject ob = it.next();
                if(ob.getId() > max){
                    max = ob.getId();
                }
            }
            obj.setId(max + 1);
        }

        odb.store(obj);
    }

    public static synchronized void delete(Object obj){
        odb.delete(obj);
    }

    public static synchronized void commit(){
        odb.commit();
    }

    public static synchronized void close(){
        if(odb != null) {
            odb.close();
            odb = null;
        }
    }

    public static synchronized List<?> getAllByClass(Class klazz){
        return odb.query(klazz);
    }
}