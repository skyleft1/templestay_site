package com.templestay_site.start.dao;

import java.util.List;

import com.templestay_site.start.model.ModelUser;

public interface IDaoUser {

    ModelUser login(String userid, String userpassword);
    ModelUser getUserOne(String userid);
    List<ModelUser> getUserList();
    int insertUser(ModelUser user);
    int insertUserList(List<ModelUser> users);
    
    int updatePassword(String newpassword, String currentpassword, String userid );
    int updateUser(ModelUser updateValue, ModelUser searchValue);
    int deleteUser(ModelUser user);
}
