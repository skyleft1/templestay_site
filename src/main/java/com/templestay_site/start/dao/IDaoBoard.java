package com.templestay_site.start.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelBoard;



public interface IDaoBoard {
    
    /* 특정 게시판의 총 게시물 갯수 구하기 */
//    int getBoardTotalRecord(HashMap<String, String> hashmap);

    /* 게시판이름 구하기 */
    String getBoardName(String boardkind);

    /* 게시판 모델 객체 구하기 */
    ModelBoard getBoardOne(String boardkind);
    
    /* 게시판종류 리스트 구하기  */
    List<ModelBoard> getBoardList();
    
    /* 게시판  추가 */
    int insertBoard(ModelBoard board);
    
    /* 게시판  수정  */
    int updateBoard(ModelBoard updateValue, ModelBoard searchValue );
    
    /* 게시판  삭제  */
    int deleteBoard(ModelBoard board);
    
    
    List<ModelBoard> getBoardSearch(ModelBoard board);
    
    List<ModelBoard> getBoardPaging(String boardkind, String searchWord, Integer start, Integer end);
 
    int insertBoardList(List<ModelBoard> board);
    
    int getBoardTotalRecord(String boardkind, String searchWord);
    
    int getArticleTotalRecord(String boardkind, String searchWord);
    
    List<ModelArticle> getArticleList(String boardkind, String searchWord, Integer start, Integer end);
    
    ModelArticle getArticle(int articleno);
    
    int insertArticle(ModelArticle article);
    
    int getMaxArticleno();
    
    int updateArticle(ModelArticle updateValue, ModelArticle searchValue); 
    
    int deleteArticle(ModelArticle article);
        
    int increaseHit(int articleno);
    
    ModelArticle getNextArticle(String boardkind, int articleno, String searchWord );
    
    ModelArticle getPrevArticle(String boardkind, int articleno, String searchWord );
    
}