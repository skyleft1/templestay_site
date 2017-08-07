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
import org.springframework.web.bind.annotation.RequestParam;

import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.service.IServiceBoard;

@Controller
public class DownloadController {
    
    @Autowired
    IServiceBoard srv;
    
    @RequestMapping(value = "/download", method = RequestMethod.POST)
    public String download(Model model
            , @RequestParam(value="filename", defaultValue="") String filename
            , @RequestParam(value="tempfilename", defaultValue="") String tempfilename 
            ) {

        model.addAttribute("filename" , filename);
        model.addAttribute("tempfilename" , tempfilename);
        //filename은 URL을 통해 받는다.
        
        return "etc/download";
    }
    
}
