package com.ri4.datastudio.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CharactersController {

    @GetMapping("/characters")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="all") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }

}
