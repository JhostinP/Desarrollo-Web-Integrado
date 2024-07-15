package com.example.web;

import com.example.domain.Task;
import com.example.domain.TaskNotFoundException;
import com.example.domain.TaskRepository;

import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hantsy
 *
 */
@Named("taskHome")
@ViewScoped()
public class TaskHome implements Serializable {

    //@Inject
    private static final Logger LOGGER = Logger.getLogger(TaskHome.class.getName());
    
    @Inject 
    FacesContext facesContext;

    @Inject
    private TaskRepository taskRepository;

    private List<TaskDetails> todotasks = new ArrayList<>();

    private List<TaskDetails> doingtasks = new ArrayList<>();

    private List<TaskDetails> donetasks = new ArrayList<>();



    public void init() {
        LOGGER.log(Level.INFO, "initalizing TaskHome...");
        retrieveAllTasks();
    }



}
