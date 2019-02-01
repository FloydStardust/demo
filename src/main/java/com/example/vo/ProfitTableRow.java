package com.example.vo;


/**
 * Description: profit table view object
 * Created by Floyd on 2019/1/29 20:10
 */
public class ProfitTableRow {
    private String rowName;
    private String currentDate;
    private String lastDate;
    private int currentMonthValue;
    private int lastMonthValue;
    private double MoM;
    private double YoY;
    private int currentYTD;
    private int lastYTD;
    private double YTD_YoY;
    private int currentEstimate;
    private double completeRatio;

    public ProfitTableRow(String rowName){
        this.rowName = rowName;
    }
    public ProfitTableRow(String rowName, String currentDate, String lastDate, int currentMonthValue, int lastMonth, double MoM, double YoY, int currentYTD,
                          int lastYTD, double YTD_YoY, int currentEstimate, double completeRatio){
        this.rowName = rowName;
        this.currentDate = currentDate;
        this.lastDate = lastDate;
        this.currentMonthValue = currentMonthValue;
        this.lastMonthValue = lastMonth;
        this.MoM = MoM;
        this.YoY = YoY;
        this.currentYTD = currentYTD;
        this.lastYTD = lastYTD;
        this.YTD_YoY = YTD_YoY;
        this.currentEstimate = currentEstimate;
        this.completeRatio = completeRatio;
    }

    public void addNumbers(String currentDate, String lastDate, int currentMonthValue, int lastMonth, double MoM, double YoY, int currentYTD,
                            int lastYTD, double YTD_YoY, int currentEstimate, double completeRatio){
        this.currentDate = currentDate;
        this.lastDate = lastDate;
        this.currentMonthValue = currentMonthValue;
        this.lastMonthValue = lastMonth;
        this.MoM = MoM;
        this.YoY = YoY;
        this.currentYTD = currentYTD;
        this.lastYTD = lastYTD;
        this.YTD_YoY = YTD_YoY;
        this.currentEstimate = currentEstimate;
        this.completeRatio = completeRatio;
    }

    public String getRowName(){
        return this.rowName;
    }
    public void setRowName(String rowName){
        this.rowName = rowName;
    }
    public String getCurrentDate(){
        return currentDate;
    }
    public void setCurrentDate(String currentDate){
        this.currentDate = currentDate;
    }
    public String getLastDate(){
        return lastDate;
    }
    public void setLastDate(String lastDate){
        this.lastDate = lastDate;
    }
    public int getCurrentMonthValue(){
        return this.currentMonthValue;
    }
    public void setCurrentMonthValue(int currentMonthValue){
        this.currentMonthValue = currentMonthValue;
    }
    public int getLastMonthValue(){
        return this.lastMonthValue;
    }
    public void setLastMonthValue(int lastMonthValue){
        this.lastMonthValue = lastMonthValue;
    }
    public double getMoM(){
        return this.MoM;
    }
    public void setMoM(double MoM){
        this.MoM = MoM;
    }
    public double getYoY(){
        return this.YoY;
    }
    public void setYoY(double YoY){
        this.YoY = YoY;
    }
    public int getCurrentYTD(){
        return this.currentYTD;
    }
    public void setCurrentYTD(int currentYTD){
        this.currentYTD = currentYTD;
    }
    public int getLastYTD(){
        return this.lastYTD;
    }
    public void setLastYTD(int lastYTD){
        this.lastYTD = lastYTD;
    }
    public double getYTD_YoY(){
        return YTD_YoY;
    }
    public void setYTD_YoY(double YTD_YoY){
        this.YTD_YoY = YTD_YoY;
    }
    public int getCurrentEstimate(){
        return this.currentEstimate;
    }
    public void setCurrentEstimate(int currentEstimate){
        this.currentEstimate = currentEstimate;
    }
    public double getCompleteRatio(){
        return this.completeRatio;
    }
    public void setCompleteRatio(double completeRatio){
        this.completeRatio = completeRatio;
    }
}
