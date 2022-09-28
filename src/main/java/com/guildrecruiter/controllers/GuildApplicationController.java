package com.guildrecruiter.controllers;


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

@Controller
@RequestMapping("/guild")
public class GuildApplicationController {

    @Autowired
    private GuildApplicationService guildApplicationService;

    @Autowired
    private GuildService guildService;


}
