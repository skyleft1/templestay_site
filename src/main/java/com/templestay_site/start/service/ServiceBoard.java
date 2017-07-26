package com.templestay_site.start.service;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.templestay_site.start.dao.IDaoBoard;
import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelBoard;



@Service("serviceboard")
public class ServiceBoard implements IServiceBoard {

    private static Logger logger = LoggerFactory.getLogger(ServiceBoard.class);
    
    @Autowired
    @Qualifier("daoboard")
    private IDaoBoard daoboard;

    @Override
    public String getBoardName(String boardkind) {
        String result = null;
        try {
            result = daoboard.getBoardName(boardkind);
        } catch (Exception e) {
            logger.error("getBoardName" + e.getMessage() );
        }
        return result;
    }

    @Override
    public ModelBoard getBoardOne(String boardkind) {
        ModelBoard result = null;
        try {
            result = daoboard.getBoardOne(boardkind);
        } catch (Exception e) {
            logger.error("getBoardOne" + e.getMessage() );
        }
        
        return result;
    }

    @Override
    public List<ModelBoard> getBoardList() {
        List<ModelBoard> result = null;
        try {
            result = daoboard.getBoardList();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getBoardList" + e.getMessage() );
            throw e;
        }
        
        return result;
    }

    @Override
    public int insertBoard(ModelBoard board) {
        int result = -1;
        try {
            result = daoboard.insertBoard(board);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("insertBoard" + e.getMessage() );
            throw e;
        }
        
        return result;
    }

    @Override
    public int updateBoard(ModelBoard updateValue, ModelBoard searchValue) {
        int result = -1;
        try {
            result = daoboard.updateBoard(updateValue, searchValue);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("updateBoard" + e.getMessage() );
            throw e;
        }
        
        return result;
    }

    @Override
    public int deleteBoard(ModelBoard board) {
        int result = -1;
        try {
            result = daoboard.deleteBoard(board);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("deleteBoard" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public List<ModelBoard> getBoardSearch(ModelBoard board) {
        List<ModelBoard> result = null;
        try {
            result = daoboard.getBoardSearch(board);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getBoardSearch" + e.getMessage() );
            throw e;
        }     

        return result;
    }

    @Override
    public List<ModelBoard> getBoardPaging(String boardkind, 
            String searchWord, Integer start, Integer end) {
        
        List<ModelBoard> result = null;
        try {
            result = daoboard.getBoardPaging(boardkind, searchWord, start, end);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getBoardPaging" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int insertBoardList(List<ModelBoard> board) {
        int result = -1;
        try {
            result = daoboard.insertBoardList(board);
        } catch (Exception e) {
            logger.error("insertBoardList" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int getArticleTotalRecord(String boardkind, String searchWord) {
        int result = -1;
        try {
            result = daoboard.getArticleTotalRecord(boardkind, searchWord);
        } catch (Exception e) {
            logger.error("getArticleTotalRecord" + e.getMessage() );
        }
        return result;
    }

    @Override
    public List<ModelArticle> getArticleList(String boardkind, String searchWord,
            Integer start, Integer end) {
        List<ModelArticle> result = null;
        try {
            result = daoboard.getArticleList(boardkind, searchWord, start, end);
        } catch (Exception e) {
            logger.error("getArticleList" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public ModelArticle getArticle(int articleno) {
        ModelArticle result = null;
        try {
            result = daoboard.getArticle(articleno);
//            daoboard.increaseHit(articleno);
        } catch (Exception e) {
            logger.error("getArticle" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int insertArticle(ModelArticle article) {
        int result = -1;
        try {
            result = daoboard.insertArticle(article);
        } catch (Exception e) {
            logger.error("insertArticle" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int updateArticle(ModelArticle updateValue,
            ModelArticle searchValue) {
        int result = -1;
        try {
            result = daoboard.updateArticle(updateValue, searchValue);
        } catch (Exception e) {
            logger.error("updateArticle" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int deleteArticle(ModelArticle article) {
        int result = -1;
        try {
            result = daoboard.deleteArticle(article);
        } catch (Exception e) {
            logger.error("deleteArticle" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int increaseHit(int articleno) {
        int result = -1;
        try {
            result = daoboard.increaseHit(articleno);
        } catch (Exception e) {
            logger.error("increaseHit" + e.getMessage() );
        }
        return result;
    }

    @Override
    public ModelArticle getNextArticle(String boardkind, int articleno,
            String searchWord) {
        ModelArticle result = null;
        try {
            result = daoboard.getNextArticle(boardkind, articleno, searchWord);
        } catch (Exception e) {
            logger.error("getNextArticle" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public ModelArticle getPrevArticle(String boardkind, int articleno,
            String searchWord) {
        ModelArticle result = null;
        try {
            result = daoboard.getPrevArticle(boardkind, articleno, searchWord);
        } catch (Exception e) {
            logger.error("getPrevArticle" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int getBoardTotalRecord(String boardkind, String searchWord) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int getMaxArticleno() {
        // TODO Auto-generated method stub
        return 0;
    }

}
