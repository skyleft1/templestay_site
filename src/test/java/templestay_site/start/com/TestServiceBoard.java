package templestay_site.start.com;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.*;

import org.junit.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.templestay_site.start.model.ModelArticle;
import com.templestay_site.start.model.ModelAttachFile;
import com.templestay_site.start.model.ModelBoard;
import com.templestay_site.start.model.ModelComments;
import com.templestay_site.start.service.IServiceBoard;

import org.junit.runners.MethodSorters;

//Sorts by method name

public class TestServiceBoard {
    private static ApplicationContext context = null;
    private static IServiceBoard board  = null;
    
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        context = new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
        board = context.getBean("serviceboard", IServiceBoard.class);
        
//        context = new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
//        board   = context.getBean("serviceboard", IServiceBoard.class); 
    }
    
    @Test
    public void getBoardName() {     
        String result = board.getBoardName("data");
        assertEquals(result, "자료실");
    }
    @Test
    public void getBoardOne() {     
        ModelBoard result = board.getBoardOne("data");
        assertEquals(result.getBoardname(), "자료실");
    }
    @Test
    public void getBoardList() {     
        List<ModelBoard> result = board.getBoardList();
        assertEquals(result.get(0).getBoardname(), "새로운 공지사항");
    }
    @Test
    public void insertBoard() {     
        ModelBoard board1 = new ModelBoard();
        board1.setBoardcd("excd1");
        board1.setBoardname("exnm1");
        int result = board.insertBoard(board1);
        assertEquals(result, 1);
    }
    @Test
    public void updateBoard() {
        ModelBoard searchboard = new ModelBoard();
        searchboard.setBoardname("exnm1");
        ModelBoard updateboard = new ModelBoard();
        updateboard.setBoardname("exnm3");    
        int result = board.updateBoard(updateboard, searchboard);
        assertEquals(result, 1);
    }
    @Test
    public void deleteBoard() {
        ModelBoard deleteboard = new ModelBoard();
        deleteboard.setBoardname("exnm3");
        int result = board.deleteBoard(deleteboard);
        assertEquals(result, 1);
    }
    @Test
    public void getBoardSearch() {
        ModelBoard searchboard = new ModelBoard();
        searchboard.setBoardname("자료실");
        List<ModelBoard> result = board.getBoardSearch(searchboard);
        assertEquals(result.size(), 1);
    }
    @Test
    public void getBoardPaging() {
        List<ModelBoard> result = board.getBoardPaging("","",1,3);
        assertEquals(result.size(), 3);
    }
    @Test
    public void insertBoardList() {
        List<ModelBoard> list = new ArrayList<>();
        
        for(int i=0; i<3 ; i++){
            ModelBoard model = new ModelBoard();
            model.setBoardcd("a"+i);
            model.setBoardname("ex_insertBoardList");
            
            list.add(model);
        }
        int result = board.insertBoardList(list);
        assertEquals(result, 3);
    }
    @Test
    public void getArticleTotalRecord() {
        int result = board.getArticleTotalRecord("free", "article test");
        assertEquals(result, 14);
    }
    @Test
    public void getArticleList() {
        List<ModelArticle> result = board.getArticleList("free","article test",1,3);
        assertEquals(result.size(), 3);
        assertNotNull(result.get(0).getUserid());
    }
    @Test
    public void getArticle() {
        ModelArticle article = new ModelArticle();
        article.setArticleno(1);
        ModelArticle result = board.getArticle(article);
        assertEquals(result.getBoardcd(), "free");
    }
    @Test
    public void insertArticle() {
        ModelArticle model = new ModelArticle();
        model.setArticleno(model.getArticleno().MAX_VALUE +1);
        model.setBoardcd("free");
        model.setTitle("추가");
        int result = board.insertArticle(model);
        assertEquals(result, 1);
    }
    @Test
    public void updateArticle() {
        ModelArticle updateValue = new ModelArticle();
        ModelArticle searchValue = new ModelArticle();
        searchValue.setTitle("추가");
        updateValue.setTitle("추가2");
        updateValue.setEmail("이메일");
        
        int result = board.updateArticle(updateValue, searchValue);
        assertEquals(result, 1);
    }
    @Test
    public void deleteArticle() {
        ModelArticle delete = new ModelArticle();
        delete.setEmail("이메일2");
        
        int result = board.deleteArticle(delete);
        assertEquals(result, 1);
    }
    @Test
    public void increaseHit() {
        int result = board.increaseHit(1);
        assertEquals(result, 1);
    }
    @Test
    public void getNextArticle() {
        ModelArticle result = board.getNextArticle("data",2 ,"콘텐츠2");
        assertEquals(result.getTitle(), "추가");
    }
    @Test
    public void getPrevArticle() {
        ModelArticle result = board.getPrevArticle("data",2 ,"콘텐츠2");
        assertEquals(result.getTitle(), "추가");
    }
    @Test
    public void getAttachFile() {
        ModelAttachFile result = board.getAttachFile(1);
        assertEquals(result.getFilename(), "어태치파일");
    }
    @Test
    public void getAttachFileList() {
        List<ModelAttachFile> result = board.getAttachFileList(1);
        assertEquals(result.get(0).getFilename(), "어태치파일");
    }
    @Test
    public void insertAttachFile() {
        ModelAttachFile model = new ModelAttachFile();
        model.setFilename("테스트1");
        model.setFiletype("테스트타입1");
        int result = board.insertAttachFile(model);
        assertEquals(result, 1);
    }
    @Test
    public void deleteAttachFile() {
        ModelAttachFile model = new ModelAttachFile();
        model.setArticleno(2);
        int result = board.deleteAttachFile(model);
        assertEquals(result, 1);
    }
    @Test
    public void getComment() {
        ModelComments model = new ModelComments();
        model.setArticleno(1);
        ModelComments result = board.getComment(model);
        assertEquals(result.getMemo(), "comment test");
    }
    @Test
    public void getCommentList() {
        List<ModelComments> result = board.getCommentList(1);
        assertEquals(result.get(0).getMemo(), "comment test");
    }
    @Test
    public void insertComment() {
        ModelComments model = new ModelComments();
        model.setArticleno(2);
        model.setMemo("comment test1");
        
        int result = board.insertComment(model);
        assertEquals(result, 1);
    }
    @Test
    public void updateComment() {
        ModelComments updateValue = new ModelComments();
        ModelComments searchValue = new ModelComments();
        searchValue.setArticleno(2);
        updateValue.setMemo("뉴뉴");

        int result = board.updateComment(updateValue, searchValue);
        assertEquals(result, 1);
    }
    @Test
    public void deleteComment() {
        ModelComments delete = new ModelComments();
        delete.setArticleno(2);
        
        int result = board.deleteComment(delete);
        assertEquals(result, 1);
    }
}
