package db;

import java.util.*;


public class Role extends DbObject {

    protected Project project;
    protected User user;
    protected RoleType type;

    public Role(){
        super();
    }

    public Role(int id){
        this();
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public RoleType getType() {
        return type;
    }

    public void setRole(RoleType type) {
        this.type = type;
    }

    public static Collection<Role> all(){
        return Database.odb.getObjects(Role.class);
    }
}
