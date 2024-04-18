/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ems.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Chirantha Prasad
 */
@Controller
public class PageController {

    @GetMapping("/home")
    public String home() {
        return "admin_dashboard";
    }

    @GetMapping("/dashbaord")
    public String dashboard() {
        return "branch_dashbaord";
    }

    @GetMapping("/IT-Dashbaord")
    public String dashboardIT() {
        return "it_dashbaord";
    }

    @GetMapping("/users")
    public String users() {
        return "users";
    }

}
