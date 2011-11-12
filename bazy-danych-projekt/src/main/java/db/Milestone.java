package db;

import java.util.*;

import com.db4o.*;

public class Milestone extends DbObject {
	

	protected String name;
	protected String description;
	protected Date deadline;
	protected Date createdAt;
	protected Date updatedAt;
	protected Project project;
	protected List<Task> tasks;
	protected List<Comment<Milestone>> comments;
	protected List<Attachment<Milestone>> attachments;
	
	
	public Milestone(){
		super();
		this.tasks = new ArrayList<Task>();
	}
	
	public Milestone(int id){
		super();
		this.id = id;
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

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	

	public static Milestone find(String sid){
        return find(Integer.parseInt(sid));
    }

    public static Milestone find(int id){
        ObjectSet<Milestone> results = Database.odb.queryByExample(new Milestone(id));
        return results.next();
    }

    public static List<Milestone> all(){
        return (List<Milestone>)Database.getAllByClass(Milestone.class);
    }

}
