package com.guildrecruiter.repositories;

import com.guildrecruiter.models.GuildApplication;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface GuildApplicationRepo extends CrudRepository<GuildApplication, Long> {

    public ArrayList<GuildApplication> findAll();
}
