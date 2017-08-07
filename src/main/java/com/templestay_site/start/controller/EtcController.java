package com.templestay_site.start.controller;


import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.service.IServiceBoard;

@Controller
@RequestMapping("/etc")
public class EtcController {
    
    @Autowired
    IServiceBoard srv;
    
    private static final Logger logger = LoggerFactory.getLogger(EtcController.class);


    
    
    
    @RequestMapping(value = "/intro01", method = RequestMethod.GET)
    public String intro01(Model model
            ) {

        return "etc/intro01";
    }
    
    @RequestMapping(value = "/intro02", method = RequestMethod.GET)
    public String intro02(Model model
            ) {

        return "etc/intro02";
    }
    @RequestMapping(value = "/monk", method = RequestMethod.GET)
    public String monk(Model model
            ) {

        return "etc/monk";
    }
    @RequestMapping(value = "/fac", method = RequestMethod.GET)
    public String fac(Model model
            ) {

        return "etc/fac";
    }
    @RequestMapping(value = "/program01", method = RequestMethod.GET)
    public String program01(Model model
            ) {

        return "etc/program01";
    }
    @RequestMapping(value = "/program02", method = RequestMethod.GET)
    public String program02(Model model
            ) {

        return "etc/program02";
    }
    @RequestMapping(value = "/program03", method = RequestMethod.GET)
    public String program03(Model model
            ) {

        return "etc/program03";
    }
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String map(Model model
            ) {

        return "etc/map";
    }
    @RequestMapping(value = "/training", method = RequestMethod.GET)
    public String training(Model model
            ) {

        return "etc/training";
    }

}
