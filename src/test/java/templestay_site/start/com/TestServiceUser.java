package templestay_site.start.com;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.templestay_site.start.model.ModelUser;
import com.templestay_site.start.service.IServiceUser;

public class TestServiceUser {
    // SLF4J Logging
    private Logger logger = LoggerFactory.getLogger(this.getClass());
        
    private static ApplicationContext context = null;
    private static IServiceUser service = null;
    
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        context= new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
        service=context.getBean("serviceuser", IServiceUser.class);
    }
    
    @Test
    public void testinsertUser() {
        ModelUser user = new ModelUser();
        
        user.setUserid("yong1");
        user.setUserpassword("yooooo");
        user.setUsername("용느님");
        user.setUseremail("yongyong@yong.com");
        user.setPhonenumber("010101010101");
        
        int result = service.insertUser(user);
        
        assertSame(result , 1);
    }
    
    @Test
    public void testgetUserOne() {
        ModelUser result = service.getUserOne("yong1");
        assertEquals(result.getUserid(), "yong1");
    }

    @Test
    public void testgetUserList() {
        List<ModelUser> result = service.getUserList();
        assertSame(result.size(), 4);
        assertEquals(result.get(0).getUserid(), "aa1");
    }
    
    @Test
    public void testinsertUserList() {
        ModelUser user = null;
        List<ModelUser> list= new ArrayList<ModelUser>();
           
        for(int i=1; i<6; i=i+1){
           
            user= new ModelUser();
          
            user.setUserid("hehe1");
            user.setUserpassword("Hrtht");
            user.setUsername("김하하");
            user.setUseremail("holhol@hol.com");
            user.setPhonenumber("37878787101");
           
            list.add(user);
        }
        int result= service.insertUserList(list);
        
        assertSame(result, 5);
    }
}
