package com.atguigu.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyDateUtil {

    public static  String getMyTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(new Date());
        return format;
    }

    public static  Date getMyDate(int i){
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE,i);
        return c.getTime();
    }
}
