package com.atguigu.util;


import org.apache.wss4j.common.ext.WSPasswordCallback;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;


import java.io.IOException;

public class MyCallback implements CallbackHandler {
    public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
        //配置usrname/password的代码
        WSPasswordCallback callback = (WSPasswordCallback) callbacks[0];
        String user = callback.getIdentifier();
        String password = "";//从配置文件或数据库中获取
        if (user.equals("admin")){
            password = "123";
        }
        callback.setPassword(password);
    }
}
