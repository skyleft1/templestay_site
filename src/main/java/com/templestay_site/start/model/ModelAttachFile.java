package com.templestay_site.start.model;

import java.util.Arrays;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelAttachFile {

    Integer attachfileno   ;
    String  filename       ;
    String  filetype       ;
    Integer    filesize       ;
    Integer articleno      ;
    Date    date       ;
    String  userid      ;     
    Byte[]  imageData       ;
    
    String  tempfilename       ;
    
    public ModelAttachFile() {
        super();
    }

    public ModelAttachFile(Integer attachfileno, String filename,
            String filetype, Integer filesize, Integer articleno, Date date,
            String userid, Byte[] imageData, String tempfilename) {
        super();
        this.attachfileno = attachfileno;
        this.filename = filename;
        this.filetype = filetype;
        this.filesize = filesize;
        this.articleno = articleno;
        this.date = date;
        this.userid = userid;
        this.imageData = imageData;
        this.tempfilename = tempfilename;
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

    public Integer getFilesize() {
        return filesize;
    }

    public void setFilesize(Integer filesize) {
        this.filesize = filesize;
    }

    public Integer getArticleno() {
        return articleno;
    }

    public void setArticleno(Integer articleno) {
        this.articleno = articleno;
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

    public Byte[] getImageData() {
        return imageData;
    }

    public void setImageData(Byte[] imageData) {
        this.imageData = imageData;
    }

    public String getTempfilename() {
        return tempfilename;
    }

    public void setTempfilename(String tempfilename) {
        this.tempfilename = tempfilename;
    }

    @Override
    public String toString() {
        return "ModelAttachFile [attachfileno=" + attachfileno + ", filename="
                + filename + ", filetype=" + filetype + ", filesize=" + filesize
                + ", articleno=" + articleno + ", date=" + date + ", userid="
                + userid + ", imageData=" + Arrays.toString(imageData)
                + ", tempfilename=" + tempfilename + ", getAttachfileno()="
                + getAttachfileno() + ", getFilename()=" + getFilename()
                + ", getFiletype()=" + getFiletype() + ", getFilesize()="
                + getFilesize() + ", getArticleno()=" + getArticleno()
                + ", getDate()=" + getDate() + ", getUserid()=" + getUserid()
                + ", getImageData()=" + Arrays.toString(getImageData())
                + ", getTempfilename()=" + getTempfilename() + ", getClass()="
                + getClass() + ", hashCode()=" + hashCode() + ", toString()="
                + super.toString() + "]";
    }



}
