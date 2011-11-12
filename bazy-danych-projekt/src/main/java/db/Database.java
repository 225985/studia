package db;

import com.db4o.*;
import com.db4o.config.*;
import com.db4o.ext.Db4oUUID;
import com.db4o.extras.autoincrement.*;
import com.db4o.ta.*;
import java.util.*;

public class Database {
    public static ObjectContainer odb;

    public static void init(String dbname){
        // config
        EmbeddedConfiguration config = Db4oEmbedded.newConfiguration();
        config.file().generateUUIDs(ConfigScope.GLOBALLY);
        config.common().add(new TransparentActivationSupport());

        odb = Db4oEmbedded.openFile(config, dbname);
        //AutoIncrementSupport.install(odb);
    }

    public static void save(Object obj){
    	ObjectSet result = odb.query(DbObject.class);
    	int max = 0;
    	
    	Iterator<DbObject> it = result.iterator();
    	
    	while(result.hasNext()){
    		DbObject ob = it.next();
    		if(ob.getId() > max){
    			max = ob.getId();
    		}
    	}
    	 DbObject so = (DbObject)obj;
    	 so.setId(max + 1);
    	
        odb.store(so);
    }

    public static void delete(Object obj){
        odb.delete(obj);
    }

    public static void commit(){
        odb.commit();
    }

    public static List<?> getAllByClass(Class klazz){
        return odb.query(klazz);
    }
}