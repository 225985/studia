package db;

import java.util.*;

public class Task {
    protected String name;

    public Task(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }




    public static List<Task> all(){
        List<Task> list = new ArrayList<Task>();
        list.add(new Task("Task A"));
        list.add(new Task("Task B"));
        return list;
    }
}
