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
public class CategoryCourse {
    private int categoryCourseId;
    private String categoryCourseName;

    public CategoryCourse(){
        
    }
    public CategoryCourse(int categoryCourseId, String categoryCourseName) {
        this.categoryCourseId = categoryCourseId;
        this.categoryCourseName = categoryCourseName;
    }

    public int getCategoryCourseId() {
        return categoryCourseId;
    }

    public void setCategoryCourseId(int categoryCourseId) {
        this.categoryCourseId = categoryCourseId;
    }

    public String getCategoryCourseName() {
        return categoryCourseName;
    }

    public void setCategoryCourseName(String categoryCourseName) {
        this.categoryCourseName = categoryCourseName;
    }
}
