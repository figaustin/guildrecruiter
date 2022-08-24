package com.guildrecruiter.repositories;

import com.guildrecruiter.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {

    public User findByName(String name);

    public User findByEmail(String email);
}
