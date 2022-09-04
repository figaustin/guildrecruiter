package com.guildrecruiter.controllers;

import com.guildrecruiter.models.Guild;
import com.guildrecruiter.services.GuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/guild")
public class GuildController {

    @Autowired
    private GuildService guildService;

    @GetMapping("/{id}")
    public String guildPage(@PathVariable("id") Long id, Model model) {
        model.addAttribute("guild", guildService.findById(id));
        return "guild";
    }

    @GetMapping("/create")
    public String createGuildPage(Model model, HttpSession session){
        model.addAttribute("guild", new Guild());
        model.addAttribute("user", session.getAttribute("user"));
        return "createGuild";
    }

    @PostMapping("/create")
    public String createGuild(@Valid @ModelAttribute("guild")Guild newGuild, BindingResult res, Model model, HttpSession session) {
        if(res.hasErrors()) {
            model.addAttribute("guild", new Guild());
            return "createGuild";
        }
        guildService.create(newGuild);
        return "redirect:/";
    }
}
