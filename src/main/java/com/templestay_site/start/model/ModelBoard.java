package com.templestay_site.start.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelBoard {
    String boardcd              ;// VARCHAR(20) NOT NULL,
    String boardname        ;// VARCHAR(40) NOT NULL,
    String userid               ;// VARCHAR(20) NOT NULL,
    
    
    public ModelBoard() {
        super();
    }

    public ModelBoard(String boardcd, String boardname, String userid) {
        super();
        this.boardcd = boardcd;
        this.boardname = boardname;
        this.userid = userid;
    }

    public String getBoardcd() {
        return boardcd;
    }

    public void setBoardcd(String boardcd) {
        this.boardcd = boardcd;
    }

    public String getBoardname() {
        return boardname;
    }

    public void setBoardname(String boardname) {
        this.boardname = boardname;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "ModelBoard [boardcd=" + boardcd + ", boardname=" + boardname
                + ", userid=" + userid + "]";
    }

    
}
