package com.guildrecruiter.models;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Table(name = "guildApplications")
public class GuildApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Character name is required!")
    @Size(min = 2, message = "Character name must be at least 2 characters long!")
    private String name;

    @NotEmpty(message = "Email is required to be able to be contacted by the guild!")
    @Email(message = "Please enter a valid email!")
    private String email;

    @Min(value = 1, message = "Please enter a value!")
    private Integer characterLevel;

    @Min(value = 1, message = "Please enter a value!")
    private Integer itemLevel;

    @NotEmpty(message = "Please enter your character's class/job")
    @Size(min = 2, message = "Character class must be at least 2 characters long!")
    private String characterClass;

    @NotEmpty(message = "Please send a short message to the guild's recruiter!")
    @Size(min = 10, message = "Message must be a at least 10 characters long!")
    private String message;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "guild_id")
    private Guild guild;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getCharacterLevel() {
        return characterLevel;
    }

    public void setCharacterLevel(Integer characterLevel) {
        this.characterLevel = characterLevel;
    }

    public Integer getItemLevel() {
        return itemLevel;
    }

    public void setItemLevel(Integer itemLevel) {
        this.itemLevel = itemLevel;
    }

    public String getCharacterClass() {
        return characterClass;
    }

    public void setCharacterClass(String characterClass) {
        this.characterClass = characterClass;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    public Guild getGuild() {
        return guild;
    }

    public void setGuild(Guild guild) {
        this.guild = guild;
    }
}
