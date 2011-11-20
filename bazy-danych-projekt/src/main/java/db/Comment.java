package db;

import java.util.*;

public class Comment<T> extends DbObject {

    protected User author;
    protected Date createdAt;
    protected String content;
    protected T parent;
    protected List<Attachment<Comment<T>>> attachments;

    public Comment(){
        super();
        attachments = new ArrayList<Attachment<Comment<T>>>();
    }

    public Comment(int id){
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public T getParent() {
        return parent;
    }

    public void setParent(T parent) {
        this.parent = parent;
    }

    public List<Attachment<Comment<T>>> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<Attachment<Comment<T>>> attachments) {
        this.attachments = attachments;
    }

    public static Collection<Comment> all(){
        return Database.odb.getObjects(Comment.class);
    }

}
