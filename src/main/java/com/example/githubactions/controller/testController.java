package com.example.githubactions.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class testController {

    @GetMapping("/test6")
    public String test6() {
        return "test 6";
    }

    @GetMapping("/test7")
    public String test7() {
        return "test 7";
    }
}
