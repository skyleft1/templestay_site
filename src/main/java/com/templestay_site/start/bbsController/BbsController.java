package com.templestay_site.start.bbsController;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/bbs/bbs", method = RequestMethod.GET)
	public String bbs(Locale locale, Model model) {
		logger.info("고고", locale);

//		model.addAttribute("serverTime", formattedDate );
		
		return "bbs/bbs";
	}
	
    @RequestMapping(value = "/bbs/bbs_view", method = RequestMethod.GET)
    public String bbs_view(Locale locale, Model model) {
        logger.info("고고", locale);

        return "bbs/bbs_view";
    }
}
