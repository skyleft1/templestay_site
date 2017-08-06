package com.templestay_site.start.model;

import java.util.Arrays;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelAttachFile {

    Integer attachfileno   ;
    String  filename       ;
    String  filetype       ;
    Long    filesize       ;
    Integer articleno      ;
    Date    InsertDT       ;
    String  userid      ;     
    Byte[]  imageData       ;
    
    public ModelAttachFile() {
        super();
    }

    public ModelAttachFile(Integer attachfileno, String filename,
            String filetype, Long filesize, Integer articleno, Date insertDT,
            String userid, Byte[] imageData) {
        super();
        this.attachfileno = attachfileno;
        this.filename = filename;
        this.filetype = filetype;
        this.filesize = filesize;
        this.articleno = articleno;
        InsertDT = insertDT;
        this.userid = userid;
        this.imageData = imageData;
    }

    public Integer getAttachfileno() {
        return attachfileno;
    }

    public void setAttachfileno(Integer attachfileno) {
        this.attachfileno = attachfileno;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public Long getFilesize() {
        return filesize;
    }

    public void setFilesize(Long filesize) {
        this.filesize = filesize;
    }

    public Integer getArticleno() {
        return articleno;
    }

    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
    }

    public Date getInsertDT() {
        return InsertDT;
    }

    public void setInsertDT(Date insertDT) {
        InsertDT = insertDT;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Byte[] getImageData() {
        return imageData;
    }

    public void setImageData(Byte[] imageData) {
        this.imageData = imageData;
    }

    @Override
    public String toString() {
        return "ModelAttachFile [attachfileno=" + attachfileno + ", filename="
                + filename + ", filetype=" + filetype + ", filesize=" + filesize
                + ", articleno=" + articleno + ", InsertDT=" + InsertDT
                + ", userid=" + userid + ", imageData="
                + Arrays.toString(imageData) + "]";
    }

}
