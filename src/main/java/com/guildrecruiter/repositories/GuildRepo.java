package com.guildrecruiter.repositories;

import com.guildrecruiter.models.Guild;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface GuildRepo extends CrudRepository<Guild, Long> {

    public ArrayList<Guild> findAll();

}
