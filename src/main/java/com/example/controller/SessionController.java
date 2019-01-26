package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class SessionController {
    @GetMapping("/login")
    String login() {
        return "login";
    }

    @GetMapping("/signup")
    String signupPage() {
        return "signup";
    }

//    @PostMapping("/signup")
//    String signupAction(@RequestParam String username,
//                        @RequestParam String password,
//                        @RequestParam String email,
//                        HttpServletRequest request) {
//        userService.create(username, password, email);
//        return "redirect:/";
//    }
}
