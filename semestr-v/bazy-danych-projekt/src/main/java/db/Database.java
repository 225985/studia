package db;

import org.neodatis.odb.*;
import org.neodatis.odb.impl.core.query.criteria.*;
import org.neodatis.odb.impl.core.query.values.*;
import java.util.*;

public class Database {
    public static ODB odb = null;
    public static ODBServer server = null;
    public static String dbname;

    public static synchronized void init(String name) {
        System.out.println("Database # init!!!");




        OdbConfiguration.setLogServerStartupAndShutdown(false);
        // OdbConfiguration.setDatabaseCharacterEncoding("UTF-8");

        dbname = name;

        if(odb != null) odb.close();
        if(server != null) server.close();

        server = ODBFactory.openServer(9001);
        server.startServer(true);

        // tmp
        odb = newClient();
    }

    public static ODB newClient(){
        return server.openClient(dbname);
    }

    public static synchronized int nextId(){
        int maxId = 0;
        CriteriaQuery query = new CriteriaQuery(DbObject.class);
        query.setPolymorphic(true);
        Collection<DbObject> results = odb.getObjects(query);
        for(DbObject obj : results){
            if(obj.getId() > maxId) maxId = obj.getId();
        }

        return (maxId + 1);
    }

    public static synchronized void save(DbObject obj){
        if(obj.getId() == 0){
            obj.setId(nextId());
        }

        try {
            odb.store(obj);
            odb.commit();
        } catch (Exception e){
            System.out.println("Exception: " + e.getMessage());
            init(dbname);
        }
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
        try {
            odb.delete(obj);
        } catch (Exception e){
            System.out.println("Exception: " + e.getMessage());
            init(dbname);
        }
    }

    public static synchronized void commit(){
        try {
            odb.commit();
        } catch (Exception e){
            System.out.println("Exception: " + e.getMessage());
            init(dbname);
        }
    }

    // public static synchronized List<?> getAllByClass(Class klazz){
    //     return odb.query(klazz);
    // }
}