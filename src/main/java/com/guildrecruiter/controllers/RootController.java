package com.guildrecruiter.controllers;

import com.guildrecruiter.models.LoginUser;
import com.guildrecruiter.models.User;
import com.guildrecruiter.services.GuildService;
import com.guildrecruiter.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("")
public class RootController {

    @Autowired
    private UserService userService;

    @Autowired
    private GuildService guildService;

    @GetMapping("")
    public String index(Model model, HttpSession session) {
        model.addAttribute("guilds", guildService.findAll());
        model.addAttribute("user", session.getAttribute("user"));
        return "index";
    }

    @GetMapping("/signup")
    public String signup(Model model, HttpSession session) {
        model.addAttribute("userRegister", new User());
        return "signup";
    }

    @PostMapping("/signup")
    public String sendSignUp(@Valid @ModelAttribute("userRegister") User newUser, BindingResult res, Model model, HttpSession session) {
        if(res.hasErrors()) {
            model.addAttribute("userLogin", new LoginUser());
            return "signup";
        }

        User db_user = userService.register(newUser, res);
        if(db_user == null) {
            model.addAttribute("userLogin", new LoginUser());
            return "signup";
        }
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("userLogin", new LoginUser());
        return "login";
    }

    @PostMapping("/login")
    public String loginSend(@Valid @ModelAttribute("userLogin") LoginUser newLogin, BindingResult res, Model model, HttpSession session) {
        if(res.hasErrors()) {
            model.addAttribute("userLogin", new LoginUser());
            return "login";
        }

        User db_user = userService.login(newLogin, res);
        if(db_user == null) {
            return "login";
        }

        session.setAttribute("user", db_user);

        return "redirect:/";
    }

}
