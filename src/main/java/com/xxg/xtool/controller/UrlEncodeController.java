package com.xxg.xtool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/urlEncode")
public class UrlEncodeController {

    @GetMapping("/index")
    public String index() {
        return "urlEncode/index";
    }
}
