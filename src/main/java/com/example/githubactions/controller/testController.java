package com.example.githubactions.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class testController {

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/test2")
    public String test2() {
        return "test2";
    }

    @GetMapping("/test3")
    public String test3() {
        return "test3";
    }

    @GetMapping("/test4")
    public String test4() {
        return "test4 and 5";
    }

    @GetMapping("/test5")
    public String test5() {
        return "and 5";
    }

    @GetMapping("/test6")
    public String test6() {
        return "and 6";
    }
}
