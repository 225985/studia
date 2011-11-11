package db;

import java.util.List;

import com.db4o.ObjectSet;

public class Role extends DbObject {

	protected Project project;
	protected User user;
	protected RoleType role;
	
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

	public RoleType getRole() {
		return role;
	}

	public void setRole(RoleType role) {
		this.role = role;
	}
	
	public static Role find(String sid){
        return find(Integer.parseInt(sid));
    }

    public static Role find(int id){
        ObjectSet<Role> results = Database.odb.queryByExample(new Role(id));
        return results.next();
    }

    public static List<Role> all(){
        return (List<Role>)Database.getAllByClass(Role.class);
    }
}
