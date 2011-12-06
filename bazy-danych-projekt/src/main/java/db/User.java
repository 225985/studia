package db;

import java.util.*;
import org.neodatis.odb.*;
import org.neodatis.odb.core.query.*;
import org.neodatis.odb.core.query.nq.SimpleNativeQuery;

public class User extends DbObject {
    private String login;
    private String email;
    private String encryptedPassword;

    private String firstName;
    private String lastName;
    private List<Project> projects;
    private List<Task> tasks;
    private List<Comment<?>> comments;
    private List<Attachment<?>> attachments;
    private List<Role> roles;


    public User(){
        super();
        this.tasks = new ArrayList<Task>();
        this.projects = new ArrayList<Project>();
        this.comments = new ArrayList<Comment<?>>();
        this.attachments = new ArrayList<Attachment<?>>();
        this.firstName = "";
        this.lastName = "";
        this.login = "";
        this.email = "";
    }

    public User(int id){
        this();
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEncryptedPassword(){
        return this.encryptedPassword;
    }

    public void setEncryptedPassword(String encryptedPassword){
        this.encryptedPassword = encryptedPassword;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getName(){
        return getFirstName() + " " + getLastName();
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public void addTask(Task task){
        this.tasks.add(task);
    }

    public void removeTask(Task task){
        this.tasks.remove(task);
    }

	public void addProject(Project project) {
		this.projects.add(project);
	}

	public void addComment(Comment<?> comment){
	    this.comments.add(comment);
	}

	public void addAttachment(Attachment<?> comment){
	    this.attachments.add(comment);
	}

	public List<Comment<?>> getComments(){
	    return this.comments;
	}

    public static Collection<User> all(){
        return Database.odb.getObjects(User.class);
    }


    public static User findByEmail(final String email){
        IQuery query = new SimpleNativeQuery() {
            public boolean match(User user){
                return user.getEmail().equals(email);
            }
        };

        Objects users = Database.odb.getObjects(query);
        if(users.hasNext()){
            return (User)users.next();
        } else {
            return null;
        }
    }
}
