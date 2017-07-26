package com.templestay_site.start.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelBoard {
    String  boardkind  ; 
    String  boardname  ; 
    Boolean useYN  ; 
    String  insertUID  ;                             
    Date    insertdate  ;
    String  updateUID  ;                             
    Date    updatedate  ; 
    
    public ModelBoard() {
        super();
    }
    public ModelBoard(String boardkind, String boardname, Boolean useYN,
            String insertUID, Date insertdate, String updateUID,
            Date updatedate) {
        super();
        this.boardkind = boardkind;
        this.boardname = boardname;
        this.useYN = useYN;
        this.insertUID = insertUID;
        this.insertdate = insertdate;
        this.updateUID = updateUID;
        this.updatedate = updatedate;
    }
    public String getBoardkind() {
        return boardkind;
    }
    public void setBoardkind(String boardkind) {
        this.boardkind = boardkind;
    }
    public String getBoardname() {
        return boardname;
    }
    public void setBoardname(String boardname) {
        this.boardname = boardname;
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
    @Override
    public String toString() {
        return "ModelBoard [boardkind=" + boardkind + ", boardname=" + boardname
                + ", useYN=" + useYN + ", insertUID=" + insertUID
                + ", insertdate=" + insertdate + ", updateUID=" + updateUID
                + ", updatedate=" + updatedate + "]";
    }
    
    
    
}
