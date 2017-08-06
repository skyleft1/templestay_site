package com.templestay_site.start.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelArticle {

    Integer articleno ;
    String  boardcd   ;
    String  title           ;
    String  content     ;
    String  email        ;
    Integer hit          ;
    Date    date         ;
    String  userid      ;
    
    // 추가된 필드. 
    Integer attachfileNum   ;
    Integer commentNum  ;
    
    
    
    public ModelArticle() {
        super();
    }
    
    public ModelArticle(Integer articleno) {
        super();
        this.articleno = articleno;
    }
    
    public ModelArticle(String title, String content) {
        super();
        this.title = title;
        this.content = content;
    }
    
    public ModelArticle(String boardcd, String title, String content) {
        super();
        this.boardcd = boardcd;
        this.title = title;
        this.content = content;
    }
        
    public ModelArticle(String boardcd, String title, String content, String userid) {
        super();
        this.boardcd = boardcd;
        this.title = title;
        this.content = content;
        this.userid = userid;
    }

    public Integer getArticleno() {
        return articleno;
    }

    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }

    public String getBoardcd() {
        return boardcd;
    }

    public void setBoardcd(String boardcd) {
        this.boardcd = boardcd;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
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
        return "ModelArticle [articleno=" + articleno + ", boardcd=" + boardcd
                + ", title=" + title + ", content=" + content + ", email="
                + email + ", hit=" + hit + ", date=" + date + ", userid="
                + userid + ", attachfileNum=" + attachfileNum + ", commentNum="
                + commentNum + "]";
    }
}

