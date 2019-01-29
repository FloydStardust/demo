package com.example.vo;


/**
 * Description: demo
 * Created by VKC on 2019/1/29 20:10
 */
public class ProfitTableRow {
    private String rowName;
    private String date;
    private int currentMonth;
    private int lastMonth;
    private double MoM;
    private double YoY;
    private int currentYTD;
    private int lastYTD;
    private double YTD_YoY;
    private int currentEsimate;
    private double completeRatio;

    public ProfitTableRow(String rowName){
        this.rowName = rowName;
    }
    public ProfitTableRow(String rowName, String date, int currentMonth, int lastMonth, double MoM, double YoY, int currentYTD,
                          int lastYTD, double YTD_YoY, int currentEsimate, double completeRatio){
        this.rowName = rowName;
        this.date = date;
        this.currentMonth = currentMonth;
        this.lastMonth = lastMonth;
        this.MoM = MoM;
        this.YoY = YoY;
        this.currentYTD = currentYTD;
        this.lastYTD = lastYTD;
        this.YTD_YoY = YTD_YoY;
        this.currentEsimate = currentEsimate;
        this.completeRatio = completeRatio;
    }

    public void addNumbers(String date, int currentMonth, int lastMonth, double MoM, double YoY, int currentYTD,
                            int lastYTD, double YTD_YoY, int currentEsimate, double completeRatio){
        this.date = date;
        this.currentMonth = currentMonth;
        this.lastMonth = lastMonth;
        this.MoM = MoM;
        this.YoY = YoY;
        this.currentYTD = currentYTD;
        this.lastYTD = lastYTD;
        this.YTD_YoY = YTD_YoY;
        this.currentEsimate = currentEsimate;
        this.completeRatio = completeRatio;
    }

    public String getRowName(){
        return this.rowName;
    }
    public void setRowName(String rowName){
        this.rowName = rowName;
    }
    public String getDate(){
        return date;
    }
    public void setDate(String date){
        this.date = date;
    }
    public int getCurrentMonth(){
        return this.currentMonth;
    }
    public void setCurrentMonth(int currentMonth){
        this.currentMonth = currentMonth;
    }
    public int getLastMonth(){
        return this.lastMonth;
    }
    public void setLastMonth(int lastMonth){
        this.lastMonth = lastMonth;
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
    public int getCurrentEsimate(){
        return this.currentEsimate;
    }
    public void setCurrentEsimate(int currentEsimate){
        this.currentEsimate = currentEsimate;
    }
    public double getCompleteRatio(){
        return this.completeRatio;
    }
    public void setCompleteRatio(double completeRatio){
        this.completeRatio = completeRatio;
    }
}
