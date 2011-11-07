package db;

import java.util.*;
import com.db4o.*;

public class Task extends DbObject {
    protected String name;

    public Task(){
        super();
    }

    public Task(int id){
        this();
        this.id = id;
    }

    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    public boolean save(){
        Database.save(this);
        return true;
    }

    public boolean destroy(){
        Database.delete(this);
        return true;
    }

    public static Task find(String sid){
        return find(Integer.parseInt(sid));
    }

    public static Task find(int id){
        ObjectSet<Task> results = Database.odb.queryByExample(new Task(id));
        return results.next();
    }

    public static List<Task> all(){
        return (List<Task>)Database.getAllByClass(Task.class);
    }
}
