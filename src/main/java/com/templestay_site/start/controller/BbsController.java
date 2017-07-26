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

	@RequestMapping(value = "/article_list/{boardcd}", method = RequestMethod.GET)
	public String article_list(Model model
	        , @PathVariable(value="boardcd") String boardcd
	        , @RequestParam(value="articleno", defaultValue="1") Integer articleno
//            , @RequestParam(value="curPage", defaultValue="1") int curPage
//            , @RequestParam(value="searchWord", defaultValue="") String searchWord
	        ) {
		logger.info("article_list");

        List<ModelBoard> list = srv.getBoardList();
        model.addAttribute("list", list );
        // 계속 써줘야 하는가?
		
 		List<ModelArticle> list2 = srv.getArticleList(boardcd, null, 1, 10);
		model.addAttribute("list2", list2 );
		
		String boardnm = srv.getBoardName(boardcd); 
		model.addAttribute("boardnm", boardnm );
		
		model.addAttribute("boardcd", boardcd );
		model.addAttribute("articleno", articleno );
		
		return "board/article_list";
	}
	
    
    
	
    @RequestMapping(value = "/article_view/{boardcd}/{articleno}", method = RequestMethod.GET)
    public String bbs_view(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            ) {
        logger.info("article_view");

        List<ModelBoard> list = srv.getBoardList();
        model.addAttribute("list", list );
        // 계속 써줘야 하는가?
        
        ModelArticle article = srv.getArticle(articleno);
        model.addAttribute("article", article );
        
        return "board/article_view";
    }
}
