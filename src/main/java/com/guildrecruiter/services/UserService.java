package com.guildrecruiter.services;

import com.guildrecruiter.models.LoginUser;
import com.guildrecruiter.models.User;
import com.guildrecruiter.repositories.GuildRepo;
import com.guildrecruiter.repositories.UserRepo;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import javax.servlet.http.HttpSession;

@Service
public class UserService {

    @Autowired
    private UserRepo userRepo;

    public User register(User newUser, BindingResult res) {

        if (userRepo.findByEmail(newUser.getEmail()) != null) {
            res.rejectValue("email", "email invalid", "A user with this email already exists!");
            return null;
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            res.rejectValue("password", "pass_no_match", "Password and confirmation must match!");
            res.rejectValue("confirm", "pass_no_match", "Password and confirmation must match!");
            return null;
        }

        String form_password = newUser.getPassword();
        String hash = BCrypt.hashpw(form_password, BCrypt.gensalt(8));
        newUser.setPassword(hash);
        userRepo.save(newUser);
        return newUser;
    }

    public User login(LoginUser loginUser, BindingResult res) {
        User db_User = userRepo.findByEmail(loginUser.getEmail());

        if(db_User == null) {
            res.rejectValue("email", "email_not_found", "Invalid Email");
            return null;
        }

        boolean isMatch = BCrypt.checkpw(loginUser.getPassword(), db_User.getPassword());

        if(!isMatch) {
            res.rejectValue("password", "pass_no_match", "Password is invalid");
            return null;
        }

        return db_User;
    }

    public void logout(HttpSession session) {

        if(session.getAttribute("user")!= null) {
            session.removeAttribute("user");
        }
    }

    public User findById(Long id) {
        return userRepo.findById(id).orElse(null);
    }
}
