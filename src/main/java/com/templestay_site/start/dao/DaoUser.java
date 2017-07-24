package com.templestay_site.start.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.templestay_site.start.model.ModelUser;


@Repository("daoUser")
public class DaoUser implements IDaoUser {
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;
    
    
    @Override
    public ModelUser getUserOne(String userid) {
        return session.selectOne("mapper.mapperUser.getUserOne", userid);
    }
    
    @Override
    public List<ModelUser> getUserList() {
        return session.selectList("mapper.mapperUser.getUserList");
    }
    
    @Override
    public int insertUser(ModelUser user) {
        return session.insert("mapper.mapperUser.insertUser", user);
    }
    
    @Override
    public int insertUserList(List<ModelUser> users) {
        return session.insert("mapper.mapperUser.insertUserList", users);
    }
}
