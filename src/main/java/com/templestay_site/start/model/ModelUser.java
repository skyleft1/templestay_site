package com.templestay_site.start.model;

import java.sql.Date;

public class ModelUser {
    
        private Integer         userno ; 
        private String          userid ;
        private String          userpassword ; 
        private String          username ;
        private String          useremail ;
        private String          phonenumber ;
        private String          addr_postcode ;
        private String          addr_road ;
        private String          addr_jibun ;
        private Date            joindate ;
        
        public ModelUser() {
            super();
        }
        
        public ModelUser(String userid, String userpassword) {
            super();
            this.userid = userid;
            this.userpassword = userpassword;
        }

        public ModelUser(Integer userno, String userid, String userpassword,
                String username, String useremail, String phonenumber,
                String addr_postcode, String addr_road, String addr_jibun,
                Date joindate) {
            super();
            this.userno = userno;
            this.userid = userid;
            this.userpassword = userpassword;
            this.username = username;
            this.useremail = useremail;
            this.phonenumber = phonenumber;
            this.addr_postcode = addr_postcode;
            this.addr_road = addr_road;
            this.addr_jibun = addr_jibun;
            this.joindate = joindate;
        }

        public Integer getUserno() {
            return userno;
        }

        public void setUserno(Integer userno) {
            this.userno = userno;
        }

        public String getUserid() {
            return userid;
        }

        public void setUserid(String userid) {
            this.userid = userid;
        }

        public String getUserpassword() {
            return userpassword;
        }

        public void setUserpassword(String userpassword) {
            this.userpassword = userpassword;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getUseremail() {
            return useremail;
        }

        public void setUseremail(String useremail) {
            this.useremail = useremail;
        }

        public String getPhonenumber() {
            return phonenumber;
        }

        public void setPhonenumber(String phonenumber) {
            this.phonenumber = phonenumber;
        }

        public String getAddr_postcode() {
            return addr_postcode;
        }

        public void setAddr_postcode(String addr_postcode) {
            this.addr_postcode = addr_postcode;
        }

        public String getAddr_road() {
            return addr_road;
        }

        public void setAddr_road(String addr_road) {
            this.addr_road = addr_road;
        }

        public String getAddr_jibun() {
            return addr_jibun;
        }

        public void setAddr_jibun(String addr_jibun) {
            this.addr_jibun = addr_jibun;
        }

        public Date getJoindate() {
            return joindate;
        }

        public void setJoindate(Date joindate) {
            this.joindate = joindate;
        }

        @Override
        public String toString() {
            return "ModelUser [userno=" + userno + ", userid=" + userid
                    + ", userpassword=" + userpassword + ", username="
                    + username + ", useremail=" + useremail + ", phonenumber="
                    + phonenumber + ", addr_postcode=" + addr_postcode
                    + ", addr_road=" + addr_road + ", addr_jibun=" + addr_jibun
                    + ", joindate=" + joindate + ", getUserno()=" + getUserno()
                    + ", getUserid()=" + getUserid() + ", getUserpassword()="
                    + getUserpassword() + ", getUsername()=" + getUsername()
                    + ", getUseremail()=" + getUseremail()
                    + ", getPhonenumber()=" + getPhonenumber()
                    + ", getAddr_postcode()=" + getAddr_postcode()
                    + ", getAddr_road()=" + getAddr_road()
                    + ", getAddr_jibun()=" + getAddr_jibun()
                    + ", getJoindate()=" + getJoindate() + ", getClass()="
                    + getClass() + ", hashCode()=" + hashCode()
                    + ", toString()=" + super.toString() + "]";
        }


}
