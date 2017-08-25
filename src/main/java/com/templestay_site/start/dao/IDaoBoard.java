package com.templestay_site.start.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelAttachFile;
import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.model.ModelComments;



public interface IDaoBoard {
    

    String getBoardName(String boardcd);

    ModelBoard getBoardOne(String boardcd);

    List<ModelBoard> getBoardList();

    int insertBoard(ModelBoard board);

    int updateBoard(ModelBoard updateValue, ModelBoard searchValue );

    int deleteBoard(ModelBoard board);
    
    
    List<ModelBoard> getBoardSearch(ModelBoard board);

    List<ModelBoard> getBoardPaging(String boardcd, String searchWord, Integer start, Integer end);
 
    int insertBoardList(List<ModelBoard> board);
    
    int getBoardTotalRecord(String boardcd, String searchWord);
    int getArticleTotalRecord(String boardcd, String searchWord);
    
    List<ModelArticle> getArticleList(String boardcd, String searchWord, Integer start, Integer end);
    
    ModelArticle getArticleOne(int articleno);
    
    ModelArticle getArticle(ModelArticle article);
    
    int insertArticle(ModelArticle article);
    
    int updateArticle(ModelArticle updateValue, ModelArticle searchValue); 
    
    int deleteArticle(ModelArticle article);
    
        
    int increaseHit(int articleno);
    
    ModelArticle getNextArticle(String boardcd, int articleno, String searchWord );
    // 용님과 다름
    
    ModelArticle getPrevArticle(String boardcd, int articleno, String searchWord );
    
    ModelAttachFile getAttachFile(int attachfileno);
    
    List<ModelAttachFile> getAttachFileList(int articleno);
    
    int insertAttachFile(ModelAttachFile attachfile);
        
    int deleteAttachFile(ModelAttachFile attachfile);
    
    ModelComments getComment(ModelComments comment);
    
    List<ModelComments> getCommentList(int articleno);
    
    int insertComment(ModelComments comment);
    
    int updateComment(ModelComments updateValue, ModelComments searchValue);
    
    int deleteComment(ModelComments comment);

}