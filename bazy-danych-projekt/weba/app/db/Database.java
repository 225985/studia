package db;

import org.neodatis.odb.*;
import org.neodatis.odb.impl.core.query.criteria.*;
import java.util.*;

public class Database {
    public static ODB odb;
    public static ODBServer server;
    public static String dbname;

    public static synchronized void init(String name) {
        OdbConfiguration.setLogServerStartupAndShutdown(false);
        // OdbConfiguration.setDatabaseCharacterEncoding("UTF-8");

        dbname = name;

        server = ODBFactory.openServer(9001);
        server.startServer(true);

        // tmp
        odb = newClient();
    }

    public static ODB newClient(){
        return server.openClient(dbname);
    }

    public static synchronized void save(DbObject obj){
        odb.store(obj);
    }

    // public static synchronized void save(DbObject obj){
    //     if(obj.getId() == 0){
    //         ObjectSet result = odb.query(DbObject.class);
    //         int max = 0;
    //
    //         Iterator<DbObject> it = result.iterator();
    //
    //         while(it.hasNext()){
    //             DbObject ob = it.next();
    //             if(ob.getId() > max){
    //                 max = ob.getId();
    //             }
    //         }
    //         obj.setId(max + 1);
    //     }
    //
    //     odb.store(obj);
    // }



    public static synchronized void delete(Object obj){
        odb.delete(obj);
    }

    public static synchronized void commit(){
        odb.commit();
    }

    // public static synchronized List<?> getAllByClass(Class klazz){
    //     return odb.query(klazz);
    // }
}