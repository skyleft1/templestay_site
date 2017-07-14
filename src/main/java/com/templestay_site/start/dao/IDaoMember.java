package com.templestay_site.start.dao;

import java.util.List;

import com.templestay_site.start.model.ModelMember;

public interface IDaoMember {
    
    ModelMember getMemberOne(String id);
    List<ModelMember> getMemberList();
    int insertMember(ModelMember Member);
    int insertMemberList(List<ModelMember> Members);
}
