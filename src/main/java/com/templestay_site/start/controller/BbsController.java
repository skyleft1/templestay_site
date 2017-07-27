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

 		List<ModelArticle> list2 = srv.getArticleList(boardcd, null, 1, 10);
		model.addAttribute("list2", list2 );
		
		String boardnm = srv.getBoardName(boardcd); 
		model.addAttribute("boardnm", boardnm );
		
		model.addAttribute("boardcd", boardcd );
		model.addAttribute("articleno", articleno );
		
		return "board/article_list";
	}

// view jsp
    @RequestMapping(value = "/article_view/{boardcd}/{articleno}", method = RequestMethod.GET)
    public String article_view(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            ) {
        logger.info("article_view");
        
        ModelArticle article = srv.getArticle(articleno);
        model.addAttribute("article", article );
        
        return "board/article_view";
    }
    
    // write jsp
    @RequestMapping(value = "/article_modify/{boardcd}/{articleno}", method = RequestMethod.GET)
    public String article_modify(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @ModelAttribute ModelArticle article
            ) {
        logger.info("article_modify");
        
        article = srv.getArticle(articleno);
        model.addAttribute("article", article );
        
        return "board/article_write";
    }
    
    
    // write jsp
    @RequestMapping(value = "/article_write/{boardcd}", method = RequestMethod.GET)
    public String article_write_GET(Model model
            , @PathVariable(value="boardcd") String boardcd
            ) {
        logger.info("article_write");
        
        return "/board/article_write";
    }
    
    // modify 를 이용한 값 추가
    @RequestMapping(value = "/article_write/{boardcd}/{articleno}", method = RequestMethod.POST)
    public String article_write_POST_modify(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @RequestParam(value="title", defaultValue="") String title
            , @RequestParam(value="content", defaultValue="") String content
            , @RequestParam(value="useYN", defaultValue="true") Boolean useYN

            ) {
        logger.info("article_write");
        
        ModelArticle searchValue = new ModelArticle();
        searchValue = srv.getArticle(articleno);
        ModelArticle updateValue = new ModelArticle();
        updateValue.setBoardcd(boardcd);
        updateValue.setTitle(title);
        updateValue.setContent(content);
        updateValue.setUseYN(useYN);
        int result = srv.updateArticle(updateValue, searchValue);
        
        if (result == 1) {
            return "redirect:/board/article_view/{boardcd}/{articleno}";
        } else {
            return "redirect:/board/article_write/{boardcd}/{articleno}";
        }
    }
    
    // write 를 이용한 값 추가
    @RequestMapping(value = "/article_write/{boardcd}", method = RequestMethod.POST)
    public String article_write_POST_write(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @RequestParam(value="title", defaultValue="") String title
            , @RequestParam(value="content", defaultValue="") String content
            , @RequestParam(value="useYN", defaultValue="true") Boolean useYN
            ) {
        logger.info("article_write");
        ModelArticle article = new ModelArticle(boardcd, title, content);
        int result = srv.insertArticle(article);

         if (result == 1) {
            return "redirect:/board/article_list/{boardcd}";
        } else {
            return "redirect:/board/article_write/{boardcd}";
        }
    }
}
