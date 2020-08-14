package com.xxg.xtool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

@Controller
@RequestMapping("/characterEntity")
public class CharacterEntityController {

    @GetMapping("/index")
    public String index() {
        return "characterEntity/index";
    }

    @ResponseBody
    @PostMapping("/encode")
    public String encode(String text) {
        return HtmlUtils.htmlEscape(text);
    }

    @ResponseBody
    @PostMapping("/decode")
    public String decode(String text) {
        return HtmlUtils.htmlUnescape(text);
    }
}
