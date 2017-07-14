package com.templestay_site.start.service;

import java.util.List;

import com.templestay_site.start.model.ModelMember;

public interface IServiceMember {

    ModelMember getMemberOne(String id);
    List<ModelMember> getMemberList();
    int insertMember(ModelMember Member);
    int insertMemberList(List<ModelMember> Members);
}
