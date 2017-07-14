package com.templestay_site.start;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.templestay_site.start.model.ModelMember;
import com.templestay_site.start.service.IServiceMember;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestServiceMember {

    private static ApplicationContext context = null;
    private static IServiceMember service = null;
    
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        context= new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
        service=context.getBean("serviceMember", IServiceMember.class);
    }
    
    @Test
    public void testinsertMember() {
        ModelMember member = new ModelMember();
        
        member.setId("yong1");
        member.setPassword("yooooo");
        member.setName("용느님");
        member.setEmail("yongyong@yong.com");
        member.setPhone(010101010101);
        
        int result = service.insertMember(member);
        
        assertSame(result , 1);
    }
    
    
    @Test
    public void testgetMemberOne() {
        ModelMember result = service.getMemberOne("yong1");
        
        assertEquals(result.getId(), "yong1");
    }

    @Test
    public void testgetMemberList() {
        ModelMember member= new ModelMember();
        
        List<ModelMember> result = service.getMemberList();
        assertSame(result.size(), 1);
        assertEquals(result.get(0).getId(), "yong1");
    }
    
    
    @Test
    public void testinsertMemberList() {
        ModelMember member = null;
        List<ModelMember> list= new ArrayList<ModelMember>();
           
        for(int i=1; i<6; i=i+1){
           
            member= new ModelMember();
          
            member.setId("wook1");
            member.setPassword("하하하");
            member.setName("근욱이");
            member.setEmail("wook@wook.com");
            member.setPhone(145454551);
           
            list.add(member);
        }
        int result= service.insertMemberList(list);
        
        assertSame(result, 5);
    }
}
