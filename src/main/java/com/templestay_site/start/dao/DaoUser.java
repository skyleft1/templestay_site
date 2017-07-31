package com.templestay_site.start.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.templestay_site.start.model.ModelUser;


@Repository("daouser")
public class DaoUser implements IDaoUser {
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;
    

    @Override
    public ModelUser login( String userid, String userpassword) {
        ModelUser user = new ModelUser(userid, userpassword);
        return session.selectOne("mapper.mapperUser.login", user);
    }
    
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

    @Override
    public int updatePassword(String newpassword, String currentpassword, String userid) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("newpassword", newpassword);
        map.put("currentpassword", currentpassword);
        map.put("userid", userid);
        return session.insert("mapper.mapperUser.updatePassword", map);
    }

    @Override
    public int updateUser(ModelUser updateValue, ModelUser searchValue) {
        Map<String, ModelUser> map = new HashMap<String, ModelUser>();
        map.put("updateValue", updateValue);
        map.put("searchValue", searchValue);
        return session.insert("mapper.mapperUser.updateUser", map);
    }

    @Override
    public int deleteUser(ModelUser user) {
        return session.insert("mapper.mapperUser.deleteUser", user);
    }

    @Override
    public int checkuserid(String userid) {
        return session.insert("mapper.mapperUser.checkuserid", userid);
    }

}
