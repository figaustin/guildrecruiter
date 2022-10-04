package com.guildrecruiter.controllers;


import com.guildrecruiter.models.Guild;
import com.guildrecruiter.models.GuildApplication;
import com.guildrecruiter.services.GuildApplicationService;
import com.guildrecruiter.services.GuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/guild")
public class GuildApplicationController {

    @Autowired
    private GuildApplicationService guildApplicationService;

    @Autowired
    private GuildService guildService;

    @GetMapping("/{id}/applications")
    public String applications(@PathVariable("id") Long id, Model model, HttpSession session){
        Guild guild = guildService.findById(id);
        List<GuildApplication> guildApplicationList = guild.getGuildApplications();

        model.addAttribute("guild", guild);
        model.addAttribute("guildApplications", guildApplicationList);
        return "guildApplications";
    }
    @GetMapping("/{id}/applications/{appId}")
    public String appMessage(@PathVariable("id")Long guildId, @PathVariable("appId")Long appId, Model model, HttpSession session) {
        Guild guild = guildService.findById(guildId);
        GuildApplication guildApplication = guildApplicationService.findById(appId);
        model.addAttribute("guild", guild);
        model.addAttribute("application", guildApplication);
        return "application";
    }

    @DeleteMapping("/{id}/applications/{appId}/delete")
    public String deleteApp(@PathVariable("id")Long guildId, @PathVariable("appId") Long appId, Model model, HttpSession session) {
        guildApplicationService.delete(appId);
        return "redirect:/guild/" + guildId + "/applications";
    }
}
