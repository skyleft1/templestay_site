package com.templestay_site.start.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.templestay_site.start.model.ModelMember;


@Repository("daoMember")
public class DaoMember implements IDaoMember {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;
    
    
    @Override
    public ModelMember getMemberOne(String id) {
        return session.selectOne("mapper.mysql.mapperMember.getMemberOne", id);
    }
    
    @Override
    public List<ModelMember> getMemberList() {
        return session.selectList("mapper.mysql.mapperMember.getMemberList");
    }
    
    @Override
    public int insertMember(ModelMember member) {
        return session.insert("mapper.mysql.mapperMember.insertMember", member);
    }
    
    @Override
    public int insertMemberList(List<ModelMember> members) {
        return session.insert("mapper.mysql.mapperMember.insertMemberList", members);
    }
}
