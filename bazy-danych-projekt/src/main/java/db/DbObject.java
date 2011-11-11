package db;

import com.db4o.ext.Db4oUUID;
import com.db4o.extras.autoincrement.*;


public class DbObject {
    @AutoIncrement protected int id; // do not touch me!

    public int getId(){
        return this.id;
    }

    public DbObject(){

    }

    public boolean save(){
        Database.save(this);
        return true;
    }

    public boolean destroy(){
        Database.delete(this);
        return true;
    }
}
