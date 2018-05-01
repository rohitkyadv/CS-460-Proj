/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

public class PostFB{
    private String description,image_path,post_display,username,contactno,address,profiledisplay,emailID,groupList;

    public String getGroupList() {
        return groupList;
    }

    public void setGroupList(String groupList) {
        this.groupList = groupList;
    }
    private int post_id,sender_id,reciver_id;

    public String getContactno() {
        return contactno;
    }

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProfiledisplay() {
        return profiledisplay;
    }

    public void setProfiledisplay(String profiledisplay) {
        this.profiledisplay = profiledisplay;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public String getPost_display() {
        return post_display;
    }

    public void setPost_display(String post_display) {
        this.post_display = post_display;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public int getReciver_id() {
        return reciver_id;
    }

    public void setReciver_id(int reciver_id) {
        this.reciver_id = reciver_id;
    }


}

