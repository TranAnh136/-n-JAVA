/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;
import java.util.Date;

/**
 *
 * @author Pham An
 */
public class Course{
    private int courseId;
    private String courseName;
    private Date coursesTimeStart;
    private Date coursesTimeFinish;
    private int categoryCourseId;
    private String courseAddress;
    private int teacherId;
    private String courseImages;
    private String introduce;
    private Time time;
    private int duration;
    private String infomationCourse;
    private String imagesCourse1;
    private String imagesCourse2;
    private String benifitOfCourse;
    
    public Course(){
        
    }

    public Course(int courseId, String courseName, Date coursesTimeStart, Date coursesTimeFinish, int categoryCourseId, String courseAddress, int teacherId, String courseImages, String introduce, Time time, int duration, String infomationCourse, String imagesCourse1, String imagesCourse2, String benifitOfCourse) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.coursesTimeStart = coursesTimeStart;
        this.coursesTimeFinish = coursesTimeFinish;
        this.categoryCourseId = categoryCourseId;
        this.courseAddress = courseAddress;
        this.teacherId = teacherId;
        this.courseImages = courseImages;
        this.introduce = introduce;
        this.time = time;
        this.duration = duration;
        this.infomationCourse = infomationCourse;
        this.imagesCourse1 = imagesCourse1;
        this.imagesCourse2 = imagesCourse2;
        this.benifitOfCourse = benifitOfCourse;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Date getCoursesTimeStart() {
        return coursesTimeStart;
    }

    public void setCoursesTimeStart(Date coursesTimeStart) {
        this.coursesTimeStart = coursesTimeStart;
    }

    public Date getCoursesTimeFinish() {
        return coursesTimeFinish;
    }

    public void setCoursesTimeFinish(Date coursesTimeFinish) {
        this.coursesTimeFinish = coursesTimeFinish;
    }

    public int getCategoryCourseId() {
        return categoryCourseId;
    }

    public void setCategoryCourseId(int categoryCourseId) {
        this.categoryCourseId = categoryCourseId;
    }

    public String getCourseAddress() {
        return courseAddress;
    }

    public void setCourseAddress(String courseAddress) {
        this.courseAddress = courseAddress;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getCourseImages() {
        return courseImages;
    }

    public void setCourseImages(String courseImages) {
        this.courseImages = courseImages;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getInfomationCourse() {
        return infomationCourse;
    }

    public void setInfomationCourse(String infomationCourse) {
        this.infomationCourse = infomationCourse;
    }

    public String getImagesCourse1() {
        return imagesCourse1;
    }

    public void setImagesCourse1(String imagesCourse1) {
        this.imagesCourse1 = imagesCourse1;
    }

    public String getImagesCourse2() {
        return imagesCourse2;
    }

    public void setImagesCourse2(String imagesCourse2) {
        this.imagesCourse2 = imagesCourse2;
    }

    public String getBenifitOfCourse() {
        return benifitOfCourse;
    }

    public void setBenifitOfCourse(String benifitOfCourse) {
        this.benifitOfCourse = benifitOfCourse;
    }
    
}
