package com.templestay_site.start.model;

import java.sql.Date;

public class ModelUser {
    
        private Integer         userno ; 
        private String          userid ;
        private String          userpassword ; 
        private String          username ;
        private String          useremail ;
        private String          phonenumber ;
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
                Date joindate) {
            super();
            this.userno = userno;
            this.userid = userid;
            this.userpassword = userpassword;
            this.username = username;
            this.useremail = useremail;
            this.phonenumber = phonenumber;
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
                    + phonenumber + ", joindate=" + joindate + "]";
        }

        

        
}
