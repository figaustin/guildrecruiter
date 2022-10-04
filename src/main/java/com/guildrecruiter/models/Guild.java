package com.guildrecruiter.models;


import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "guilds")
public class Guild {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    @Size(min = 3, max = 24, message = "Guild name must be between 3 and 24 characters long")
    private String name;

    private Integer members;

    @NotEmpty
    @Size(min = 10, max = 200, message = "Description must be between 10 and 200 characters long")
    private String description;

    @NotEmpty(message = "Mindset field cannot be empty!")
    private String mindset;

    @NotEmpty(message = "Language field cannot be empty!")
    private String language;

    @NotEmpty(message = "Faction field cannot be empty! If none, put N/A")
    private String faction;

    @NotEmpty(message = "Server field cannot be empty!")
    private String server;

    @NotEmpty(message = "Region field cannot be empty!")
    private String region;

    @NotEmpty(message = "Interest field cannot be empty!")
    private String interest;

    @NotEmpty(message = "Game field cannot be empty!")
    private String game;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "guild", fetch = FetchType.LAZY)
    private List<GuildApplication> guildApplications;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

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

    public Integer getMembers() {
        return members;
    }

    public void setMembers(Integer members) {
        this.members = members;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMindset() {
        return mindset;
    }

    public void setMindset(String mindset) {
        this.mindset = mindset;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getFaction() {
        return faction;
    }

    public void setFaction(String faction) {
        this.faction = faction;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getGame() {
        return game;
    }

    public void setGame(String game) {
        this.game = game;
    }

    public List<GuildApplication> getGuildApplications() {
        return guildApplications;
    }

    public void setGuildApplications(List<GuildApplication> guildApplications) {
        this.guildApplications = guildApplications;
    }
}
