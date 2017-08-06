package com.templestay_site.start.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelComments {
    Integer commentno   ; 
    Integer articleno   ;      
    String  memo        ;
    Date    date     ; 
    String  userid      ;                             

    public ModelComments() {
        super();
    }
    
    public ModelComments(Integer articleno ) {
        super();
        this.articleno = articleno;
    }

    public ModelComments(Integer commentno, Integer articleno, String memo,
            Date date, String userid) {
        super();
        this.commentno = commentno;
        this.articleno = articleno;
        this.memo = memo;
        this.date = date;
        this.userid = userid;
    }

    public Integer getCommentno() {
        return commentno;
    }

    public void setCommentno(Integer commentno) {
        this.commentno = commentno;
    }

    public Integer getArticleno() {
        return articleno;
    }

    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
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

    @Override
    public String toString() {
        return "ModelComments [commentno=" + commentno + ", articleno="
                + articleno + ", memo=" + memo + ", date=" + date + ", userid="
                + userid + "]";
    }
}
