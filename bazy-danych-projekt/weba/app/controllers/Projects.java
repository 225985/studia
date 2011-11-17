package controllers;

import play.*;
import play.mvc.*;

import java.util.*;

import db.*;

public class Projects extends Controller {
    public static void index(){
        Collection<Project> projects = Project.all();
        render(projects);
    }

    public static void _new(){
        Project project = new Project();
        render(project);
    }

    public static void create(String name){
        Project project = new Project();
        project.setName(name);
        project.save();
        index();
    }
}
