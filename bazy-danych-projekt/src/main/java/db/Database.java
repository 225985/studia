package db;

import com.db4o.*;
import com.db4o.config.*;
import com.db4o.ext.Db4oUUID;
import com.db4o.extras.autoincrement.*;
import java.util.*;

public class Database {
    public static ObjectContainer odb;

    public static void init(String dbname){
        // config
        EmbeddedConfiguration config = Db4oEmbedded.newConfiguration();
        config.file().generateUUIDs(ConfigScope.GLOBALLY);

        odb = Db4oEmbedded.openFile(config, dbname);
        AutoIncrementSupport.install(odb);
    }

    public static void save(Object obj){
        odb.store(obj);
    }

    public static void delete(Object obj){
        odb.delete(obj);
    }

    public static List<?> getAllByClass(Class klazz){
        return odb.query(klazz);
    }
}