package db;

import java.util.*;

import com.db4o.*;

public class TimeEntry extends DbObject {
	  
	protected Date startTime;
	protected Date endtime;
	protected User user;
	protected Task task;
	
	public TimeEntry(){
		super();
	}
	
	public TimeEntry(int id){
		this();
		this.id = id;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}
	
	public static TimeEntry find(String sid){
        return find(Integer.parseInt(sid));
    }

    public static TimeEntry find(int id){
        ObjectSet<TimeEntry> results = Database.odb.queryByExample(new TimeEntry(id));
        return results.next();
    }

    public static List<TimeEntry> all(){
        return (List<TimeEntry>)Database.getAllByClass(TimeEntry.class);
    }

}
