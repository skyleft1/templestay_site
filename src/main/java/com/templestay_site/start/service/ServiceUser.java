package com.templestay_site.start.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.templestay_site.start.dao.IDaoUser;
import com.templestay_site.start.model.ModelUser;

@Service("serviceuser")
public class ServiceUser implements IServiceUser {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    @Qualifier("daouser")
    IDaoUser dao;
    
    
    @Override
    public ModelUser login(String userid, String userpassword) {
        ModelUser result = null;
        try {
            result = dao.login(userid, userpassword);
        } catch (Exception e) {
            logger.error("getUserOne" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public ModelUser getUserOne(String userid) {
        ModelUser result = null;
        try {
            result = dao.getUserOne(userid);
        } catch (Exception e) {
            logger.error("getUserOne" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public List<ModelUser> getUserList() {
        List<ModelUser> result = null;
        try {
            result = dao.getUserList();
        } catch (Exception e) {
            logger.error("getUserList" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public int insertUser(ModelUser User) {
        int result = -1;
        try {
            result = dao.insertUser(User);
        } catch (Exception e) {
            logger.error("insertUser" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public int insertUserList(List<ModelUser> Users) {
        int result = -1;
        try {
            result = dao.insertUserList(Users);
        } catch (Exception e) {
            logger.error("insertUserList" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int updatePassword(String newpassword, String currentpassword,
            String userid) {
        int result = -1;
        try {
            result = dao.updatePassword(newpassword, currentpassword, userid);
        } catch (Exception e) {
            logger.error("insertUserList" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int updateUser(ModelUser updateValue, ModelUser searchValue) {
        int result = -1;
        try {
            result = dao.updateUser(updateValue, searchValue);
        } catch (Exception e) {
            logger.error("insertUserList" + e.getMessage() );
        }
        return result;
    }

    @Override
    public int deleteUser(ModelUser user) {
        int result = -1;
        try {
            result = dao.deleteUser(user);
        } catch (Exception e) {
            logger.error("insertUserList" + e.getMessage() );
        }
        return result;
    }


}
