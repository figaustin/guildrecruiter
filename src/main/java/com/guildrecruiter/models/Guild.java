package com.guildrecruiter.models;

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

    private String mindset;

    private String language;

    private String faction;

    private String server;

    private String region;

    private String interest;

    private String game;

}
