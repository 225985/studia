package db;

import java.util.*;

public class User extends DbObject {
    private String login;
    private String email;
    private String firstName;
    private String lastName;
    private List<Project> projects;
    private List<Task> tasks;
    private List<Comment<User>> comments;
    private List<Role> roles;


    public User(){
        super();
        this.tasks = new ArrayList<Task>();
        this.projects = new ArrayList<Project>();
    }

    public User(int id){
        super();
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

    public static Collection<User> all(){
        return Database.odb.getObjects(User.class);
    }
}
