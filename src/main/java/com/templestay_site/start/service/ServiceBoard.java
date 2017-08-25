package com.templestay_site.start.service;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.templestay_site.start.dao.IDaoBoard;
import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelAttachFile;
import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.model.ModelComments;


@Service("serviceboard")
public class ServiceBoard implements IServiceBoard {

    private static Logger logger = LoggerFactory.getLogger(ServiceBoard.class);
    
    @Autowired
    @Qualifier("daoboard")
    private IDaoBoard daoboard;

    @Override
    public String getBoardName(String boardcd) {
        String result = null;
        try {
            result = daoboard.getBoardName(boardcd);
        } catch (Exception e) {
            logger.error("getBoardName" + e.getMessage() );
        }
        
        return result;
    }

    @Override
    public ModelBoard getBoardOne(String boardcd) {
        ModelBoard result = null;
        try {
            result = daoboard.getBoardOne(boardcd);
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
    public List<ModelBoard> getBoardPaging(String boardcd, 
            String searchWord, Integer start, Integer end) {
        
        List<ModelBoard> result = null;
        try {
            result = daoboard.getBoardPaging(boardcd, searchWord, start, end);
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
    public int getArticleTotalRecord(String boardcd, String searchWord) {
        int result = -1;
        try {
            result = daoboard.getArticleTotalRecord(boardcd, searchWord);
        } catch (Exception e) {
            logger.error("getArticleTotalRecord" + e.getMessage() );
        }
        return result;
    }

    @Override
    public List<ModelArticle> getArticleList(String boardcd, String searchWord,
            Integer start, Integer end) {
        List<ModelArticle> result = null;
        try {
            result = daoboard.getArticleList(boardcd, searchWord, start, end);
        } catch (Exception e) {
            logger.error("getArticleList" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public ModelArticle getArticleOne(int articleno) {
        ModelArticle result = null;
        try {
            result = daoboard.getArticleOne(articleno);
        } catch (Exception e) {
            logger.error("getArticle" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public ModelArticle getArticle(ModelArticle article) {
        ModelArticle result = null;
        try {
            result = daoboard.getArticle(article);
        } catch (Exception e) {
            logger.error("getArticle" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int insertArticle(ModelArticle article) {
        int result = -1;
        try {
            result = daoboard.insertArticle(article);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
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
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("updateArticle" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int deleteArticle(ModelArticle article) {
        int result = -1;
        try {
            result = daoboard.deleteArticle(article);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("deleteArticle" + e.getMessage() );
            throw e;
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
    public ModelArticle getNextArticle(String boardcd, int articleno,
            String searchWord) {
        ModelArticle result = null;
        try {
            result = daoboard.getNextArticle(boardcd, articleno, searchWord);
        } catch (Exception e) {
            logger.error("getNextArticle" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public ModelArticle getPrevArticle(String boardcd, int articleno,
            String searchWord) {
        ModelArticle result = null;
        try {
            result = daoboard.getPrevArticle(boardcd, articleno, searchWord);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getPrevArticle" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public ModelAttachFile getAttachFile(int attachfileno) {
        ModelAttachFile result = null;
        try {
            result = daoboard.getAttachFile(attachfileno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getAttachFile" + e.getMessage() );
            throw e;
        } 
        return result;
    }

    @Override
    public List<ModelAttachFile> getAttachFileList(int articleno) {
        List<ModelAttachFile> result = null;
        try {
            result = daoboard.getAttachFileList(articleno);
        } catch (Exception e) {
            logger.error("getAttachFileList" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int insertAttachFile(ModelAttachFile attachfile) {
        int result = -1;
        try {
            result = daoboard.insertAttachFile(attachfile);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("insertAttachFile" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int deleteAttachFile(ModelAttachFile attachfile) {
        int result = -1;
        try {
            result = daoboard.deleteAttachFile(attachfile);
        } catch (Exception e) {
            logger.error("deleteAttachFile" + e.getMessage() );
        }
        return result;
    }

    @Override
    public ModelComments getComment(ModelComments comment) {
        ModelComments result = null;
        try {
            result = daoboard.getComment(comment);
        } catch (Exception e) {
            logger.error("getComment" + e.getMessage() );
        }
        return result;
    }

    @Override
    public List<ModelComments> getCommentList(int articleno) {
        List<ModelComments> result = null;
        try {
            result = daoboard.getCommentList(articleno);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("getCommentList" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int insertComment(ModelComments comment) {
        int result = -1;
        try {
            result = daoboard.insertComment(comment);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("insertComment" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int updateComment(ModelComments updateValue,
            ModelComments searchValue) {
        int result = -1;
        try {
            result = daoboard.updateComment(updateValue, searchValue);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("updateComment" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int deleteComment(ModelComments comment) {
        int result = -1;
        try {
            result = daoboard.deleteComment(comment);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("deleteComment" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int getBoardTotalRecord(String boardcd, String searchWord) {
        // TODO Auto-generated method stub
        return 0;
    }
    
    
}