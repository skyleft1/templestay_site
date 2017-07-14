package com.templestay_site.start.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.templestay_site.start.dao.IDaoMember;
import com.templestay_site.start.model.ModelMember;

@Service("serviceMember")
public class ServiceMember implements IServiceMember {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    @Qualifier("daoMember")
    IDaoMember dao; 
    
    
    @Override
    public ModelMember getMemberOne(String id) {
        ModelMember result = null;
        try {
            result = dao.getMemberOne(id);
        } catch (Exception e) {
            logger.error("getMemberOne" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public List<ModelMember> getMemberList() {
        List<ModelMember> result = null;
        try {
            result = dao.getMemberList();
        } catch (Exception e) {
            logger.error("getMemberList" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public int insertMember(ModelMember Member) {
        int result = -1;
        try {
            result = dao.insertMember(Member);
        } catch (Exception e) {
            logger.error("insertMember" + e.getMessage() );
        }
        return result;
    }
    
    @Override
    public int insertMemberList(List<ModelMember> Members) {
        int result = -1;
        try {
            result = dao.insertMemberList(Members);
        } catch (Exception e) {
            logger.error("insertMemberList" + e.getMessage() );
        }
        return result;
    }
}
