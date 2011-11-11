package db;

import java.util.*;
import com.db4o.*;

public class Task extends DbObject {

	
	
	
	protected String name;
	protected String description;
	protected User assignee;
	//protected Enum... status;
	protected Date deadline;
	//protected enum kind kind;
	protected Date createdAt;
	protected Date updatedAt;
	//protected List<TimeEntries> timeEntries;
	//protected List<Comment<Task>> comments;
	//protected List<Attachment<Task>> attachments;
	protected int estimatedTime;
	
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

    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getAssignee() {
		return assignee;
	}

	public void setAssignee(User assignee) {
		this.assignee = assignee;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getEstimatedTime() {
		return estimatedTime;
	}

	public void setEstimatedTime(int estimatedTime) {
		this.estimatedTime = estimatedTime;
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
