package com.atguigu.listener;


import com.atguigu.mapper.IndexMapper;
import org.springframework.beans.factory.annotation.Autowired;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class MyMessageListener implements MessageListener {
    @Autowired
    IndexMapper indexMapper;
    @Override
    public void onMessage(Message message) {
        Map<String,Object> map = new HashMap<String, Object>();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        String format = simpleDateFormat.format(date);
        map.put("date",format);
        TextMessage textMessage = (TextMessage) message;
        try {
            String str = textMessage.getText();
            map.put("message","MQ|"+str);
            indexMapper.log(map);
            System.out.println(str);
        } catch (JMSException e) {

        }
    }
}
