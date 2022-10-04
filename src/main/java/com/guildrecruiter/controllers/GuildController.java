package com.guildrecruiter.controllers;

import com.guildrecruiter.models.Guild;
import com.guildrecruiter.models.GuildApplication;
import com.guildrecruiter.models.User;
import com.guildrecruiter.services.GuildApplicationService;
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

    @Autowired
    private GuildApplicationService guildApplicationService;

    @GetMapping("/{id}")
    public String guildPage(@PathVariable("id") Long id, Model model) {
        model.addAttribute("guild", guildService.findById(id));
        model.addAttribute("guildApplication", new GuildApplication());
        return "guild";
    }

    @PostMapping("/{guildId}")
    public String apply(@Valid @ModelAttribute("guildApplication")GuildApplication guildApplication, BindingResult result, @PathVariable("guildId") Long guildId, Model model, HttpSession session) {
        if(result.hasErrors()) {
            model.addAttribute("guild", guildService.findById(guildId));
            model.addAttribute("guildApplication", new GuildApplication());
            return "guild";
        }
        guildApplicationService.create(guildApplication);
        return "redirect:/";
    }

    @GetMapping("/create")
    public String createGuildPage(Model model, HttpSession session){
        if(session.getAttribute("user") == null) {
            return "redirect:/";
        }
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
        User user = (User) session.getAttribute("user");
        Long userId = user.getId();
        guildService.create(newGuild);
        return "redirect:/user/" + userId;
    }

    @GetMapping("/list")
    public String allGuilds(Model model, HttpSession session) {
        model.addAttribute("guilds", guildService.findAll());
        return "allGuilds";
    }

    @GetMapping("/edit/{id}")
    public String editGuild(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }
        User user = (User) session.getAttribute("user");
        if(user.getId() != guildService.findById(id).getUser().getId()) {
            return "redirect:/";
        }

        model.addAttribute("guild", guildService.findById(id));
        return "editGuild";
    }

    @PostMapping("/edit/{id}")
    public String update(@Valid @ModelAttribute("guild")Guild guild, BindingResult result, @PathVariable("id") Long id, Model model, HttpSession session) {
        if(result.hasErrors()) {
            model.addAttribute("guild", guildService.findById(id));
            return "editGuild";
        }

        guildService.update(guild);
        return "redirect:/user/" + guild.getUser().getId();
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id){
        Guild guild = guildService.findById(id);
        guildService.delete(id);
        return "redirect:/user/" + guild.getUser().getId();
    }
}
