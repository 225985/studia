package db;

import java.util.*;
import com.db4o.*;

public class Project extends DbObject {

	protected String name;
	protected String description;
    // protected User owner;
	protected Date createdAt;
	protected Date updatedAt;
    // protected List<Milestone> milestones;
    protected List<Task> tasks;
    // protected List<Attachment<Project>> attachments;
    // protected List<Comment<Project>> comments;
    // protected List<Role> roles;


	public Project(){
        super();
        tasks = new ArrayList<Task>();
    }

    public Project(int id){
        this();
        this.id = id;
    }

	public Task createTask(Task task){
        // task.setProject(this);
	    this.tasks.add(task);
	    this.save();
	    return task;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

    // public User getOwner() {
    //  return owner;
    // }
    //
    // public void setOwner(User owner) {
    //  this.owner = owner;
    // }
    //
    // public Date getCreatedAt() {
    //  return createdAt;
    // }
    //
    // public void setCreatedAt(Date createdAt) {
    //  this.createdAt = createdAt;
    // }
    //
    // public Date getUpdatedAt() {
    //  return updatedAt;
    // }
    //
    // public void setUpdatedAt(Date updatedAt) {
    //  this.updatedAt = updatedAt;
    // }
    //
    // public List<Milestone> getMilestones() {
    //  return milestones;
    // }
    //
    // public void setMilestones(List<Milestone> milestones) {
    //  this.milestones = milestones;
    // }
    //
    // public List<Attachment<Project>> getAttachments() {
    //  return attachments;
    // }
    //
    // public void setAttachments(List<Attachment<Project>> attachments) {
    //  this.attachments = attachments;
    // }
    //
    // public List<Comment<Project>> getComments() {
    //  return comments;
    // }
    //
    // public void setComments(List<Comment<Project>> comments) {
    //  this.comments = comments;
    // }
    //
    // public List<Role> getRoles() {
    //  return roles;
    // }
    //
    // public void setRoles(List<Role> roles) {
    //  this.roles = roles;
    // }
    //
    public List<Task> getTasks() {
        return tasks;
    }
    //
    // public void setTasks(List<Task> tasks) {
    //  this.tasks = tasks;
    // }
    //


    public static Collection<Project> all(){
        return Database.odb.getObjects(Project.class);
    }

}
