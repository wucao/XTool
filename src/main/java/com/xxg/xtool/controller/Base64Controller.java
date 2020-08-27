package com.xxg.xtool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

@Controller
@RequestMapping("/base64")
public class Base64Controller {

    @GetMapping("/index")
    public String index() {
        return "base64/index";
    }

    @ResponseBody
    @PostMapping("/encode")
    public String encode(String text) throws UnsupportedEncodingException {
        return Base64.getEncoder().encodeToString(text.getBytes("UTF-8"));
    }

    @ResponseBody
    @PostMapping("/decode")
    public String decode(String text) throws UnsupportedEncodingException {
        return new String(Base64.getDecoder().decode(text), "UTF-8");
    }
}
