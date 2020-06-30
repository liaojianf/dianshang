package com.atguigu.server;

import org.springframework.stereotype.Service;

import javax.jws.WebService;

@WebService
@Service
public interface TestServerInf {
    public String ping(String hello);
}
