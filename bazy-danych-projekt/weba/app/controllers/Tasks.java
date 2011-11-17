package controllers;

import play.*;
import play.mvc.*;

import java.util.*;

import db.*;

public class Tasks extends Controller {
    public static void index(){
        Project project = findProject();
        List<Task> tasks = project.getTasks();
        render(project, tasks);
    }

    public static void _new(){
        Project project = findProject();
        Task task = new Task();
        render(project);
    }

    public static void create(String name){
        Project project = findProject();
        Task task = new Task();
        task.setName(name);
        task.setProject(project);
        project.getTasks().add(task);
        project.save();
        redirect("/projects/" + project.getId() + "/tasks");
    }

    public static Project findProject(){
        return (Project)Project.find(params.get("projectId", Integer.class));
    }
}
