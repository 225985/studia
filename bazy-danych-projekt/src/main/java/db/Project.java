package db;

import java.util.*;
import com.db4o.*;

public class Project extends DbObject {

	protected String name;
	protected String description;
	protected User owner;
	protected Date createdAt;
	protected Date updatedAt;
	//protected List<Milestone> milestones;
	protected List<Task> tasks;
	//protected List<Attachement<Project>> attachments;
	//protected List<Comment<Project>> comments;
	//protected List<Role> roles;

	
	public Project(){
        super();
        tasks = new ArrayList<Task>();
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
