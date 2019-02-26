package com.example.util;

/**
 * Description: Util class for lead module
 * Created by Floyd on 2019/2/25 15:09
 */
public class LeadsUtils {

    public static class LeadsType {
        public static int LEADS = 0;
        public static int PIPELINE = 1;
        public static int WATCHLIST = 2;
    }

    /**
     * The leads' status:
     * -1 for parking this lead, 0 for keeping observing
     * 1 for having met executives, 2 for having met founder, 3 for having presented in weekly meeting
     */
    public enum LeadsStatus{
        PASS("PASS", -1), OBSERVING("继续观察", 0),
        SENIOR("见过高管",1), FOUNDER("见过创始人", 2), MEETING("上过周会", 3);

        private String name;
        private int index;

        private LeadsStatus(String name, int index){
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

    /**
     * The pipelines' status:
     * 4 for passing this pipeline
     */
    public enum PipelineStatus{
        PASS("PASS", -1),
        TS("TS", 4), DD("DD", 5), IC("IC", 6), INVESTED("已投", 7);

        private String name;
        private int index;

        private PipelineStatus(String name, int index){
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
