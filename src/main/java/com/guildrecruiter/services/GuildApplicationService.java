package com.guildrecruiter.services;

import com.guildrecruiter.models.GuildApplication;
import com.guildrecruiter.repositories.GuildApplicationRepo;
import com.guildrecruiter.repositories.GuildRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class GuildApplicationService {

    @Autowired
    private GuildApplicationRepo guildApplicationRepo;

    public GuildApplication findById(Long id) {
        return guildApplicationRepo.findById(id).orElse(null);
    }

    public ArrayList<GuildApplication> findAll() {
        return (ArrayList<GuildApplication>) guildApplicationRepo.findAll();
    }

    public void create(GuildApplication guildApplication) {
        guildApplicationRepo.save(guildApplication);
    }

    public void update(GuildApplication guildApplication) {
        guildApplicationRepo.save(guildApplication);
    }

    public void delete(Long id) {
        guildApplicationRepo.deleteById(id);
    }
}
