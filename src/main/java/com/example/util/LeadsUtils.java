package com.example.util;

/**
 * Description: Util class for lead module
 * Created by Floyd on 2019/2/25 15:09
 */
public class LeadsUtils {

//    public static String UPLOAD_RECORD_PATH = "D:\\crm_files\\record\\";
    public static String UPLOAD_RECORD_PATH = "/home/ec2-user/crm/upload/record/";
//    public static String UPLOAD_BP_PATH = "D:\\crm_files\\bp\\";
    public static String UPLOAD_BP_PATH = "/home/ec2-user/crm/upload/bp/";


    public static class LeadsType {
        public static int LEADS = 0;
        public static int PIPELINE = 1;
        public static int WATCHLIST = 2;
        public static int PASS = 3;
    }
    /**
     * The leads' status:
     * -1 for parking this lead, 0 for keeping observing
     * 1 for having met executives, 2 for having met founder, 3 for having presented in weekly meeting
     */
    public enum LeadsStatus{
        BP("BP", 4), SENIOR("见过高管",5), FOUNDER("见过创始人", 6),
        MEETING("上过周会", 7), AFTER_MEETING("上过周会观察中", 8), TS("TS", 9),
        DD("转入Pipeline", 10);

        private String name;
        private int index;
        LeadsStatus(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }
    public enum PipelineStatus{
        DD("DD", 10), IC("IC汇报", 11), INVESTED("签约", 12),
        PAYING("付款", 13);

        private String name;
        private int index;
        PipelineStatus(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }
    public enum WatchlistStatus{
        NOT_TRACK("未跟踪", 14), MONTHLY("月度跟踪", 15), QUARTERLY("季度跟踪", 16);

        private String name;
        private int index;
        WatchlistStatus(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }
    public enum ReturnLeads {
        RETURN("转回Leads", 7);
        private String name;
        private int index;
        ReturnLeads(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }
    public enum ParkStatus {
        PARK("PARK", 14);

        private String name;
        private int index;
        ParkStatus(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }
    public enum PassStatus{
        PASS("PASS", 18);

        private String name;
        private int index;
        PassStatus(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

}
