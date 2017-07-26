package com.templestay_site.start.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelArticle {

    Integer articleno;
    String  boardkind;
    String  title;
    String  content;
    String  email;
    Integer hit;
    Date    regdate;
    Boolean useYN;
    String  insertUID;
    Date    insertdate;
    String  updateUID;
    Date    updatedate;
    
    // 추가된 필드. 
    Integer attachfileNum;
    Integer commentNum;
    
    public ModelArticle() {
        super();
    }
    public ModelArticle(Integer articleno, String boardkind, String title,
            String content, String email, Integer hit, Date regdate,
            Boolean useYN, String insertUID, Date insertdate, String updateUID,
            Date updatedate, Integer attachfileNum, Integer commentNum) {
        super();
        this.articleno = articleno;
        this.boardkind = boardkind;
        this.title = title;
        this.content = content;
        this.email = email;
        this.hit = hit;
        this.regdate = regdate;
        this.useYN = useYN;
        this.insertUID = insertUID;
        this.insertdate = insertdate;
        this.updateUID = updateUID;
        this.updatedate = updatedate;
        this.attachfileNum = attachfileNum;
        this.commentNum = commentNum;
    }
    public Integer getArticleno() {
        return articleno;
    }
    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }
    public String getBoardkind() {
        return boardkind;
    }
    public void setBoardkind(String boardkind) {
        this.boardkind = boardkind;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Integer getHit() {
        return hit;
    }
    public void setHit(Integer hit) {
        this.hit = hit;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public Boolean getUseYN() {
        return useYN;
    }
    public void setUseYN(Boolean useYN) {
        this.useYN = useYN;
    }
    public String getInsertUID() {
        return insertUID;
    }
    public void setInsertUID(String insertUID) {
        this.insertUID = insertUID;
    }
    public Date getInsertdate() {
        return insertdate;
    }
    public void setInsertdate(Date insertdate) {
        this.insertdate = insertdate;
    }
    public String getUpdateUID() {
        return updateUID;
    }
    public void setUpdateUID(String updateUID) {
        this.updateUID = updateUID;
    }
    public Date getUpdatedate() {
        return updatedate;
    }
    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }
    public Integer getAttachfileNum() {
        return attachfileNum;
    }
    public void setAttachfileNum(Integer attachfileNum) {
        this.attachfileNum = attachfileNum;
    }
    public Integer getCommentNum() {
        return commentNum;
    }
    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }
    @Override
    public String toString() {
        return "ModelArticle [articleno=" + articleno + ", boardkind="
                + boardkind + ", title=" + title + ", content=" + content
                + ", email=" + email + ", hit=" + hit + ", regdate=" + regdate
                + ", useYN=" + useYN + ", insertUID=" + insertUID
                + ", insertdate=" + insertdate + ", updateUID=" + updateUID
                + ", updatedate=" + updatedate + ", attachfileNum="
                + attachfileNum + ", commentNum=" + commentNum + "]";
    }
    
    

}
