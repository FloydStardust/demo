package com.example.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/28 10:13
 */
public class ScheduleUtils {
    public static class TIME_SPLIT{
        public static int NINE = 1;
        public static int HALF_NINE = 2;
        public static int TEN = 3;
        public static int HALF_TEN = 4;
        public static int ELEVEN = 5;
        public static int HALF_ELEVEN = 6;
        public static int TWELVE = 7;
        public static int HALF_TWELVE = 8;
        public static int THIRTEEN = 9;
        public static int HALF_THIRTEEN = 10;
        public static int FORTEEN = 11;
        public static int HALF_FORTEEN = 12;
        public static int FIFTEEN = 13;
        public static int HALF_FIFTEEN = 14;
        public static int SIXTEEN = 15;
        public static int HALF_SIXTEEN = 16;
        public static int SEVENTEEN = 17;
        public static int HALF_SEVENTEEN = 18;
        public static int EIGHTEEN = 19;
        public static int HALF_EIGHTEEN = 20;
        public static int NINTEEN = 21;
        public static Map<Integer, String> toMap(){
            Map<Integer, String> map = new HashMap<>();
            map.put(NINE, "9:00");
            map.put(HALF_NINE, "9:30");
            map.put(TEN, "10:00");
            map.put(HALF_TEN, "10:30");
            map.put(ELEVEN, "11:00");
            map.put(HALF_ELEVEN, "11:30");
            map.put(TWELVE, "12:00");
            map.put(HALF_TWELVE, "12:30");
            map.put(THIRTEEN, "13:00");
            map.put(HALF_THIRTEEN, "13:30");
            map.put(FORTEEN, "14:00");
            map.put(HALF_FORTEEN, "14:30");
            map.put(FIFTEEN, "15:00");
            map.put(HALF_FIFTEEN, "15:30");
            map.put(SIXTEEN, "16:00");
            map.put(HALF_SIXTEEN, "16:30");
            map.put(SEVENTEEN, "17:00");
            map.put(HALF_SEVENTEEN, "17:30");
            map.put(EIGHTEEN, "18:00");
            map.put(HALF_EIGHTEEN, "18:30");
            map.put(NINTEEN, "19:00");

            return map;
        }
    }
}
