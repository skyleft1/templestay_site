package com.templestay_site.start.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelBoard {
    String  boardcd    ; // VARCHAR2(20)    NOT NULL ENABLE
    String  boardnm    ; // VARCHAR2(40)    NOT NULL ENABLE
    Boolean UseYN      ; // NUMBER(1)       DEFAULT 1 NOT NULL ENABLE
    String  InsertUID  ; // VARCHAR(40)     NULL                            
    Date    InsertDT   ; // Date            NULL
    String  UpdateUID  ; // VARCHAR(40)     NULL                            
    Date    UpdateDT   ; // Date            NULL
    public String getBoardcd() {
        return boardcd;
    }
    public void setBoardcd(String boardcd) {
        this.boardcd = boardcd;
    }
    public String getBoardnm() {
        return boardnm;
    }
    public void setBoardnm(String boardnm) {
        this.boardnm = boardnm;
    }
    public Boolean getUseYN() {           
        return this.UseYN;    
    }
    public void setUseYN(Boolean useYN) {
            this.UseYN = useYN;
    }
    public String getInsertUID() {
        return InsertUID;
    }
    public void setInsertUID(String insertUID) {
        InsertUID = insertUID;
    }
    public Date getInsertDT() {
        return InsertDT;
    }
    public void setInsertDT(Date insertDT) {
        InsertDT = insertDT;
    }
    public String getUpdateUID() {
        return UpdateUID;
    }
    public void setUpdateUID(String updateUID) {
        UpdateUID = updateUID;
    }
    public Date getUpdateDT() {
        return UpdateDT;
    }
    public void setUpdateDT(Date updateDT) {
        UpdateDT = updateDT;
    }
    
    public ModelBoard() {
        super();
    }
    
    public ModelBoard(String boardcd, String boardnm, Boolean useYN) {
        super();
        this.boardcd = boardcd;
        this.boardnm = boardnm;
        this.UseYN = useYN;
    }
    
    @Override
    public String toString() {
        return "ModelBoard [boardcd=" + boardcd + ", boardnm=" + boardnm
                + ", UseYN=" + UseYN + ", InsertUID=" + InsertUID
                + ", InsertDT=" + InsertDT + ", UpdateUID=" + UpdateUID
                + ", UpdateDT=" + UpdateDT + "]";
    }
    
    
}
