package com.guildrecruiter.services;

import com.guildrecruiter.models.Guild;
import com.guildrecruiter.repositories.GuildRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuildService {

    @Autowired
    private GuildRepo guildRepo;

    public Guild findById(Long id){
        return guildRepo.findById(id).orElse(null);
    }

    public void create(Guild guild) {
        guildRepo.save(guild);
    }

    public void update(Guild guild){
        guildRepo.save(guild);
    }

    public void delete(Long id){
        guildRepo.deleteById(id);
    }
}
