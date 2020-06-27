/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Pham An
 */
public class SignUpCourse {
    private int sigupCourseId;
    private int courseId;
    private int quantity;
    private String name;
    private String phoneNumber;
    private String email;
    private String note;
    private int userId;

    public SignUpCourse(){
        
    }
    
    public SignUpCourse(int sigupCourseId, int courseId, int quantity, String name, String phoneNumber, String email, String note, int userId) {
        this.sigupCourseId = sigupCourseId;
        this.courseId = courseId;
        this.quantity = quantity;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.note = note;
        this.userId = userId;
    }
    
    public SignUpCourse( int courseId, int quantity, String name, String phoneNumber, String email, String note, int userId) {
      
        this.courseId = courseId;
        this.quantity = quantity;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.note = note;
        this.userId = userId;
    }

    public int getSigupCourseId() {
        return sigupCourseId;
    }

    public void setSigupCourseId(int sigupCourseId) {
        this.sigupCourseId = sigupCourseId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
}
