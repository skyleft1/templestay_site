package com.templestay_site.start.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelBoard;


@Repository("daoboard")
public class DaoBoard implements IDaoBoard {
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;    

    @Override
    public String getBoardName(String boardkind) {
        return session.selectOne("mapper.mapperBoard.getBoardName", boardkind);
    }
    @Override
    public ModelBoard getBoardOne(String boardkind) {
        return session.selectOne("mapper.mapperBoard.getBoardOne", boardkind);
    }
    @Override
    public List<ModelBoard> getBoardList() {
        return session.selectList("mapper.mapperBoard.getBoardList");
    }
    @Override
    public int insertBoard(ModelBoard board) {
        return session.insert("mapper.mapperBoard.insertBoard", board);
    }
    @Override
    public int updateBoard(ModelBoard updateValue, ModelBoard searchValue) {
        Map<String, ModelBoard> map = new HashMap<String, ModelBoard>();
        map.put("updateValue", updateValue );
        map.put("searchValue", searchValue );
        return session.update("mapper.mapperBoard.updateBoard", map);
    }
    @Override
    public int deleteBoard(ModelBoard board) {
        return session.delete("mapper.mapperBoard.deleteBoard", board);
    }
    
    @Override
    public List<ModelBoard> getBoardSearch(ModelBoard board) {
        List<ModelBoard> list = new ArrayList<>(); 
        return session.selectList("mapper.mapperBoard.getBoardSearch", board);

    }
    
    @Override
    public List<ModelBoard> getBoardPaging(String boardkind, String searchWord,
            Integer start, Integer end) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardkind", boardkind);
        map.put("searchWord", searchWord);
        map.put("start", start);
        map.put("end", end);
        return session.selectList("mapper.mapperBoard.getBoardPaging", map);
    }
    
    @Override
    public int insertBoardList(List<ModelBoard> board) {
        return session.insert("mapper.mapperBoard.insertBoardList", board);
    }
    
    @Override
    public int getBoardTotalRecord(String boardkind, String searchWord) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("boardkind", boardkind);
        map.put("searchWord", searchWord);
        return session.selectOne("mapper.mapperBoard.getBoardTotalRecord", map);
    }
    
    @Override
    public int getArticleTotalRecord(String boardkind, String searchWord) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("boardkind", boardkind);
        map.put("searchWord", searchWord);
        return session.selectOne("mapper.mapperBoard.getArticleTotalRecord", map);
    }
    
    @Override
    public List<ModelArticle> getArticleList(String boardkind, String searchWord,
            Integer start, Integer end) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardkind", boardkind);
        map.put("searchWord", searchWord);
        map.put("start", start);
        map.put("end", end);
        return session.selectList("mapper.mapperBoard.getArticleList", map);
    }
    @Override
    public ModelArticle getArticle(int articleno) {
        return session.selectOne("mapper.mapperBoard.getArticle", articleno);
    }
    @Override
    public int insertArticle(ModelArticle article) {
        return session.insert("mapper.mapperBoard.insertArticle", article);
    }
    
    @Override
    public int updateArticle(ModelArticle updateValue,
            ModelArticle searchValue) {
        Map<String, ModelArticle> map = new HashMap<String, ModelArticle>();
        map.put("updateValue", updateValue );
        map.put("searchValue", searchValue );
        return session.update("mapper.mapperBoard.updateArticle", map);
    }
    @Override
    public int deleteArticle(ModelArticle article) {
        return session.delete("mapper.mapperBoard.deleteArticle", article);
    }

    @Override
    public int increaseHit(int articleno) {
        return session.update("mapper.mapperBoard.increaseHit", articleno);
    }
    @Override
    public ModelArticle getNextArticle(String boardkind, int articleno,
            String searchWord) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardkind", boardkind);
        map.put("articleno", articleno);
        map.put("searchWord", searchWord);
        return session.selectOne("mapper.mapperBoard.getNextArticle", map);
    }
    @Override
    public ModelArticle getPrevArticle(String boardkind, int articleno,
            String searchWord) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardkind", boardkind);
        map.put("articleno", articleno);
        map.put("searchWord", searchWord);
        return session.selectOne("mapper.mapperBoard.getPrevArticle", map);
    }
    @Override
    public int getMaxArticleno() {
        // TODO Auto-generated method stub
        return 0;
    }
        
    
}
