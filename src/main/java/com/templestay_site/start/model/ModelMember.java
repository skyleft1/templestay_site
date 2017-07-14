package com.templestay_site.start.model;

public class ModelMember {
    // SLF4J Logging
    private String id ;
    private String password ; 
    private String name ;
    private String email ; 
    private Integer phone ;
    
    
    public ModelMember() {
        super();
    }
    public ModelMember(String id, String password, String name, String email,
            Integer phone) {
        super();
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public Integer getPhone() {
        return phone;
    }
    public void setPhone(Integer phone) {
        this.phone = phone;
    }
    @Override
    public String toString() {
        return "ModelMember [id=" + id + ", password=" + password + ", name="
                + name + ", email=" + email + ", phone=" + phone + "]";
    }

    
}
