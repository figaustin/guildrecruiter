package com.guildrecruiter.models;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "guildApplications")
public class GuildApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Character name is required!")
    private String name;

    @NotEmpty(message = "Email is required for being contacted by guild")
    @Email(message = "Please enter a valid email!")
    private String email;

    private Integer level;

    private String message;
}
