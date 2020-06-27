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
public class Chef {
    private int chefId;
    private String chefName;
    private String imagesChef;
    private String indoduceChef;
    
    public Chef(){
        
    }

    public Chef(int chefId, String chefName, String imagesChef, String indoduceChef) {
        this.chefId = chefId;
        this.chefName = chefName;
        this.imagesChef = imagesChef;
        this.indoduceChef = indoduceChef;
    }

    public int getChefId() {
        return chefId;
    }

    public void setChefId(int chefId) {
        this.chefId = chefId;
    }

    public String getChefName() {
        return chefName;
    }

    public void setChefName(String chefName) {
        this.chefName = chefName;
    }

    public String getImagesChef() {
        return imagesChef;
    }

    public void setImagesChef(String imagesChef) {
        this.imagesChef = imagesChef;
    }

    public String getIndoduceChef() {
        return indoduceChef;
    }

    public void setIndoduceChef(String indoduceChef) {
        this.indoduceChef = indoduceChef;
    }
}
