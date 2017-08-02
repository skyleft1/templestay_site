package com.templestay_site.start.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

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

import com.templestay_site.start.commons.PagingHelper;
import com.templestay_site.start.commons.WebConstants;
import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.model.ModelComments;
import com.templestay_site.start.model.ModelUser;
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
            , @RequestParam(value="curPage", defaultValue="1") int curPage
            , @RequestParam(value="searchWord", defaultValue="") String searchWord
	        , HttpSession session
	        ) {
		logger.info("article_list");

		// 공지사항, 자유게시판 등 name을 가져옴
        String boardnm = srv.getBoardName(boardcd); 
        model.addAttribute("boardnm", boardnm );
		
        // 전체 개시글 갯수 가져오기
        int totalRecord = srv.getArticleTotalRecord(boardcd, searchWord);
        
        // 페이지 처리
        PagingHelper paging = new PagingHelper(totalRecord, curPage);
        int start = paging.getStartRecord();
        int end = paging.getEndRecord();
            
        List<ModelArticle> list = srv.getArticleList(boardcd, searchWord, start, end);
        model.addAttribute("list", list);
        model.addAttribute("no", paging.getListNo());
        model.addAttribute("prevLink", paging.getPrevLink());
        model.addAttribute("firstPage", paging.getFirstPage());
        model.addAttribute("pageLinks", paging.getPageLinks());
        model.addAttribute("nextLink", paging.getNextLink());
        model.addAttribute("lastPage", paging.getLastPage());
		
		return "board/article_list";
	}

// view jsp
    @RequestMapping(value = "/article_view/{boardcd}/{articleno}", method = RequestMethod.GET)
    public String article_view(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            ) {
        logger.info("article_view");
        
        srv.increaseHit(articleno);
        
        ModelArticle article = srv.getArticle(articleno);
        model.addAttribute("article", article );

        List<ModelComments> list = srv.getCommentList(articleno);
        model.addAttribute("list", list );
        // comment에 쏴줌
        
        return "board/article_view";
    }
    

    
    // write jsp
    @RequestMapping(value = "/article_write/{boardcd}", method = RequestMethod.GET)
    public String article_write_GET(Model model
            , @PathVariable(value="boardcd") String boardcd
            , HttpSession session
            ) {
        logger.info("article_write");
        
        ModelUser user = (ModelUser) session.getAttribute(WebConstants.SESSION_NAME);
        if( user != null){
            model.addAttribute("a", "a");
            return "/board/article_write";
        }else{
            return "/user/user_login";
        }
    }
    
    // write 를 이용한 값 추가
    @RequestMapping(value = "/article_write/{boardcd}", method = RequestMethod.POST)
    public String article_write_POST_write(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @RequestParam(value="title", defaultValue="") String title
            , @RequestParam(value="content", defaultValue="") String content
            , @RequestParam(value="useYN", defaultValue="true") Boolean useYN
            , HttpSession session
            ) {
        logger.info("article_write");
        
        ModelArticle article = new ModelArticle(boardcd, title, content);
        
        ModelUser user =(ModelUser)session.getAttribute(WebConstants.SESSION_NAME);
        
        article.setInsertUID(user.getUserid());
        article.setEmail(user.getUseremail());
        // ModelUser의 session_user 에서 userid와 useremail을 얻어와 ModelBoard의 InserUID과 email 넣는다.
        
        int result = srv.insertArticle(article);

         if (result == 1) {
            return "redirect:/board/article_list/{boardcd}";
        } else {
            return "redirect:/board/article_write/{boardcd}";
        }
    }
    
    // modify jsp
    @RequestMapping(value = "/article_modify/{boardcd}/{articleno}", method = RequestMethod.GET)
    public String article_modify(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @ModelAttribute ModelArticle article
            ) {
        logger.info("article_modify");
        
        article = srv.getArticle(articleno);
        model.addAttribute("article", article );
        model.addAttribute("a", "b");
        
        return "board/article_write";
    }
    
    // modify 를 이용한 값 추가
    @RequestMapping(value = "/article_modify/{boardcd}/{articleno}", method = RequestMethod.POST)
    public String article_write_POST_modify(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @RequestParam(value="title", defaultValue="") String title
            , @RequestParam(value="content", defaultValue="") String content
            , @RequestParam(value="useYN", defaultValue="true") Boolean useYN

            ) {
        logger.info("article_modify");
        
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
    
    
    @RequestMapping(value = "/article_delete/{boardcd}/{articleno}", method = RequestMethod.POST)
    public String article_write_POST_modify(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @ModelAttribute ModelArticle article
            ) {
        logger.info("article_delete");
        
        int result = srv.deleteArticle(article);
        
        if (result == 1) {
            return "redirect:/board/article_list/{boardcd}";
        } else {
            return "redirect:/board/article_list/{boardcd}";
        }
    }
    
    
    // 댓글 달기
    @RequestMapping(value = "/article_comment/{boardcd}/{articleno}", method = RequestMethod.POST)
    public String article_comment(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @ModelAttribute ModelComments comment
            , HttpSession session
            ) {
        logger.info("article_comment");
        
        ModelUser user =(ModelUser)session.getAttribute(WebConstants.SESSION_NAME);
        comment.setInsertUID(user.getUserid()); 
        comment.setEmail(user.getUseremail()); 
        
        int result = srv.insertComment(comment);
        
        if (result == 1) {
            return "redirect:/board/article_list/{boardcd}";
        } else {
            return "redirect:/board/article_list/{boardcd}";
        }
    }

    @RequestMapping(value = "/article_comment_delete/{boardcd}/{articleno}", method = RequestMethod.GET)
    public String article_comment_delete(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @ModelAttribute ModelComments comment
            , HttpSession session
            ) {
        logger.info("article_comment_delete");
        
        //session의 userid 와 comment쓴 userid를 비교해 같을 경우 삭제보이기+삭제가능
        ModelUser user =(ModelUser)session.getAttribute(WebConstants.SESSION_NAME);
        user.getUserid();
        
        
        int result = srv.deleteComment(comment);
        
        if (result == 1) {
            return "redirect:/board/article_list/{boardcd}";
        } else {
            return "redirect:/board/article_list/{boardcd}";
        }
    }
}
