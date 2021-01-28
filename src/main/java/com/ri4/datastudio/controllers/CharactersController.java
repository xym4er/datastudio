package com.ri4.datastudio.controllers;

import com.ri4.datastudio.domain.ACharacters;
import com.ri4.datastudio.repos.ACharactersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class CharactersController {

    @Autowired
    private ACharactersRepo aCharactersRepo;


    @GetMapping("/pilots")
    public String greeting(Map<String, Object> model) {

        Iterable<ACharacters> characters = aCharactersRepo.findAll();
        model.put("characters", characters);
        return "pilots";
    }

}