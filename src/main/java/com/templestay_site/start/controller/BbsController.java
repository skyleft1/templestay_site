package com.templestay_site.start.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.templestay_site.start.commons.PagingHelper;
import com.templestay_site.start.commons.WebConstants;
import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelAttachFile;
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

        model.addAttribute("curPage", curPage);
		
		// 공지사항, 자유게시판 등 name을 가져옴
        String boardname = srv.getBoardName(boardcd); 
        model.addAttribute("boardname", boardname );
		
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
            , @RequestParam(value="curPage", defaultValue="1") int curPage
            , @ModelAttribute ModelArticle article
            , @ModelAttribute ModelComments comment
            ) {
        logger.info("article_view");
        
        srv.increaseHit(articleno);

        model.addAttribute("curPage", curPage );
        
        ModelArticle article1 = srv.getArticle(article);
        model.addAttribute("article", article1 );
        // article 내용 가져오기

        List<ModelComments> list = srv.getCommentList(articleno);
        model.addAttribute("list", list );
        // comment 내용 가져오기
        // session의 userid 와 comment쓴 userid를 비교해 같을 경우 삭제보이기+삭제가능
        
//      attachFileList
        List<ModelAttachFile> attachFileList = srv.getAttachFileList(articleno);
        model.addAttribute("attachFileList", attachFileList);
        
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
            return "/board/article_list";
        }
    }
    
    // write 를 이용한 값 추가
    @RequestMapping(value = "/article_write/{boardcd}", method = RequestMethod.POST)
    public String article_write_POST(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @RequestParam(value="title", defaultValue="") String title
            , @RequestParam(value="content", defaultValue="") String content
            , HttpSession session
            , MultipartFile uploadfile ) throws IllegalStateException, IOException  {
            
        logger.info("article_write");
        
        int result1 = -1;
        
        ModelArticle article = new ModelArticle(boardcd, title, content);
        
        ModelUser user =(ModelUser)session.getAttribute(WebConstants.SESSION_NAME);
        
        article.setUserid(user.getUserid());
        article.setEmail(user.getUseremail());
        // ModelUser의 session_user 에서 userid와 useremail을 얻어와 ModelBoard의 InserUID과 email 넣는다.
        
        int result2 = srv.insertArticle(article);
        ModelArticle article1 = srv.getArticle(article);
        int articleno = article1.getArticleno();
        
        if(!uploadfile.getOriginalFilename().isEmpty()){
            
            //uploadpath 존재여부 체크, 없으면 폴더 생성
            java.io.File uploadDir = new java.io.File(WebConstants.UPLOAD_PATH);
            if(!uploadDir.isDirectory()) uploadDir.mkdirs();
            
            // 클라이언트의 첨부파일을 서버로 복사
            // 2. 로컬 첨부 파일을 서버로 올리기 위한 코드
            String fileName = uploadfile.getOriginalFilename();
            String tempFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            
            String filepath = WebConstants.UPLOAD_PATH + tempFileName;                 
            java.io.File f = new java.io.File( filepath );                
            uploadfile.transferTo( f );
            
            // 3. 첨부 파일을 attachfiel 테이블에 insert.
            ModelAttachFile attachfile = new ModelAttachFile();
            attachfile.setFilename( fileName );  // 실제파일명
            attachfile.setTempfilename( f.getName() );  // 임시파일명
            
            attachfile.setFiletype( FilenameUtils.getExtension(fileName) ); //확장자
            attachfile.setFilesize( (int)f.length() );
            attachfile.setArticleno( articleno );
            
            result1 = srv.insertAttachFile(attachfile);
            
            
        }
                
        if (result2 == 1) {
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
            , @RequestParam(value="curPage", defaultValue="1") int curPage
            , @ModelAttribute ModelArticle article
            ) {
        logger.info("article_modify");
        
        model.addAttribute("curPage", curPage);
        
        ModelArticle article2 = srv.getArticle(article);
        model.addAttribute("article", article2 );
        model.addAttribute("a", "b");
        
        return "board/article_write";
    }
    
    // modify 를 이용한 값 추가
    @RequestMapping(value = "/article_modify/{boardcd}/{articleno}", method = RequestMethod.POST)
    public String article_modify_POST(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @RequestParam(value="curPage", defaultValue="1") int curPage
            , @RequestParam(value="title", defaultValue="") String title
            , @RequestParam(value="content", defaultValue="") String content
            , @ModelAttribute ModelArticle article
            ) {
        logger.info("article_modify");
        
        model.addAttribute("curPage", curPage);
        
        ModelArticle searchValue = new ModelArticle();
        searchValue = srv.getArticleOne(articleno);
        ModelArticle updateValue = new ModelArticle();
        updateValue.setBoardcd(boardcd);
        updateValue.setTitle(title);
        updateValue.setContent(content);
        
        int result = srv.updateArticle(updateValue, searchValue);
        
        if (result == 1) {
            return "redirect:/board/article_view/{boardcd}/{articleno}";
        } else {
            return "redirect:/board/article_write/{boardcd}/{articleno}";
        }
    }
    
    
    @RequestMapping(value = "/article_delete/{boardcd}/{articleno}", method = RequestMethod.POST)
    public String article_delete(Model model
            , @PathVariable(value="boardcd") String boardcd
            , @PathVariable(value="articleno") Integer articleno
            , @RequestParam(value="curPage", defaultValue="1") int curPage
            , @ModelAttribute ModelArticle article
            , @ModelAttribute ModelComments comment
            ) {
        logger.info("article_delete");
        
        model.addAttribute("curPage", curPage);
        
        ModelAttachFile attachfile = new ModelAttachFile();
        attachfile.setArticleno(articleno);
        
        srv.deleteAttachFile(attachfile);
        srv.deleteComment(comment);
        int result = srv.deleteArticle(article);
                
        if (result == 1) {
            return "redirect:/board/article_list/{boardcd}";
        } else {
            return "redirect:/board/article_list/{boardcd}";
        }
    }
    
    
    // 댓글 달기
    @RequestMapping(value = "/article_comment_write", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> article_comment_write(Model model
//            , @PathVariable(value="boardcd") String boardcd
//            , @PathVariable(value="articleno") Integer articleno
            , @RequestParam(value="articleno", defaultValue="") Integer articleno
            , @RequestParam(value="memo", defaultValue="") String memo
            , @ModelAttribute ModelComments comment
            , HttpSession session
            ) {
        logger.info("article_comment_write");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        ModelUser user =(ModelUser)session.getAttribute(WebConstants.SESSION_NAME);
        comment.setUserid(user.getUserid()); 

        int result = srv.insertComment(comment);
        ModelComments comment_date = srv.getComment(comment);
        //  디비에 인서트된 comment 의 날짜를 가져옴

        if (result == 1) {
//            map.put("commentno", comment.getCommentno());
            map.put("userid", comment.getUserid());
            map.put("memo", comment.getMemo());
            map.put("date", comment_date.getDate());
            map.put("commentno", comment_date.getCommentno());
            
            return map;
        } else {
            return null;
        }
    }



    // 댓글 수정 : post
    @RequestMapping(value = "/article_comment_modify", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> article_comment_modify(Model model
            , @RequestParam(value="commentno", defaultValue="") Integer commentno
            , @RequestParam(value="memo", defaultValue="") String memo
            , HttpSession session
            ) {
        logger.info("article_comment_modify");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        ModelComments searchValue = new ModelComments();
        searchValue.setCommentno(commentno);
        
        ModelComments updateValue = new ModelComments();
        updateValue.setMemo(memo);
        
        int result = srv.updateComment(updateValue, searchValue);
                
        if (result == 1) {
            map.put("memo", memo);
            
            return map;
        } else {
            return map;
        }
    }
    
    // 댓글 삭제
    @RequestMapping(value = "/article_comment_delete", method = RequestMethod.POST)
    @ResponseBody
    public int article_comment_delete(Model model
            , @RequestParam(value="commentno", defaultValue="") Integer commentno
            , HttpSession session
            ) {
        logger.info("article_comment_delete");

        ModelComments comment = new ModelComments();
        comment.setCommentno(commentno);
        
        int result = srv.deleteComment(comment);
        
        if (result == 1) {
            return result;
        } else {
            return result;
        }
    }
}
