package com.atguigu.server.Imp;

import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.AddressMapper;
import com.atguigu.server.AddressServerInf;
import com.atguigu.service.AddressServiceInf;
import com.atguigu.service.imp.AddressServiceImp;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;

import javax.ws.rs.*;
import java.util.List;

public class AddressServerImp implements AddressServerInf {

    @Autowired
    AddressServiceInf addressServiceImp;

    @Path("address")
    @GET
    @Consumes("application/x-www-form-urlencoded")
    @Produces("application/json")
    public String get_address() {
        List<T_MALL_ADDRESS> address = addressServiceImp.get_address();
        Gson gson = new Gson();
        return gson.toJson(address);
    }

    @Path("address")
    @GET
    @Consumes("application/x-www-form-urlencoded")
    @Produces("application/json")
    public T_MALL_ADDRESS select_address_byId(int id) {
        T_MALL_ADDRESS t_mall_address = addressServiceImp.select_address_byId(id);
        Gson gson = new Gson();
        return t_mall_address;
    }



}