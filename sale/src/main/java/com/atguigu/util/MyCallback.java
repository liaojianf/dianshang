package com.atguigu.util;


import org.apache.wss4j.common.ext.WSPasswordCallback;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;
import java.io.IOException;

//import org.apache.ws.security.WSPasswordCallback;
//import org.apache.wss4j.common.ext.WSPasswordCallback;

public class MyCallback implements CallbackHandler {
    public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
        //配置usrname/password的代码
        WSPasswordCallback callback = (WSPasswordCallback) callbacks[0];
        callback.setIdentifier("admin");
        String password = "123";//从配置文件或数据库中获取
        callback.setPassword(password);
    }
}
