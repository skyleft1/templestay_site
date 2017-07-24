package com.templestay_site.start.dao;

import java.util.List;

import com.templestay_site.start.model.ModelUser;

public interface IDaoUser {

    ModelUser getUserOne(String userid);
    List<ModelUser> getUserList();
    int insertUser(ModelUser Member);
    int insertUserList(List<ModelUser> Members);
}
