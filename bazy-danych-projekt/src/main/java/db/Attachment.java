package db;

import java.util.*;

import com.db4o.*;

public class Attachment<T> extends DbObject {
	 
	  
	  protected User author;
	  protected Date createdAt;
	  //protected File content;
	  protected T parent;
	  
	  public Attachment(){
		  super();
	  }
	  
	  public Attachment(int id){
		  this();
		  this.id = id;
	  }

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public T getParent() {
		return parent;
	}

	public void setParent(T parent) {
		this.parent = parent;
	}
	  
	public static Attachment<?> find(String sid){
        return find(Integer.parseInt(sid));
    }

    public static Attachment<?> find(int id){
        ObjectSet<Attachment<?>> results = Database.odb.queryByExample(new Attachment(id));
        return results.next();
    }

    public static List<Attachment<?>> all(){
        return (List<Attachment<?>>)Database.getAllByClass(Attachment.class);
    }
}
