package com.templestay_site.start.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.service.IServiceBoard;


@Controller
@RequestMapping("/board")
public class BbsController {
    
    @Autowired
    IServiceBoard srv;
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@RequestMapping(value = "/article_list/free", method = RequestMethod.GET)
	public String board(Model model
//	        , @PathVariable(value="boardkind") String boardkind
//            , @RequestParam(value="curPage", defaultValue="1") int curPage
//            , @RequestParam(value="searchWord", defaultValue="") String searchWord
	        , @ModelAttribute ModelBoard board
	        ) {
		logger.info("article_list");

		List<ModelArticle> list = srv.getArticleList("free", null, 1, 10);
		
		model.addAttribute("list", list );
		
		return "board/article_list";
	}
	
    @RequestMapping(value = "/article_view", method = RequestMethod.GET)
    public String bbs_view(Locale locale, Model model) {
        logger.info("고고", locale);

        return "board/article_view";
    }
}
