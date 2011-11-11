package db;

import java.util.*;
import com.db4o.*;

public class Project extends DbObject {

	private String name;
	private String description;
	private User owner;
	private Date createdAt;
	private Date updatedAt;
	//private List<Milestone> milestones;
	private List<Task> tasks;
	//private List<Attachement<Project>> attachments;
	//private List<Comment<Project>> comments;
	//private List<Role> roles;

	
	public Project(){
        super();
    }

    public Project(int id){
        this();
        this.id = id;
    }
	
	public String getName(){
		return this.name;	
	}

	public String getDecription(){
		return this.description;	
	}
	
	public Date getCreateAt(){
		return this.createdAt;
	}
	
	public Date getUpdatedAt(){
		return this.updatedAt;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public void setCreatedAt(Date createdAt){
		this.createdAt = createdAt;
	}
	
	public void setUpdateAt(Date updatedAt){
		this.updatedAt = updatedAt;
	}
	
	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	
    public static Project find(String sid){
        return find(Integer.parseInt(sid));
    }

    public static Project find(int id){
        ObjectSet<Project> results = Database.odb.queryByExample(new Project(id));
        return results.next();
    }

    public static List<Project> all(){
        return (List<Project>)Database.getAllByClass(Project.class);
    }
	
}
