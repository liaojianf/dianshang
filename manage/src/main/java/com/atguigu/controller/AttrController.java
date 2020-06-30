package com.atguigu.controller;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.service.imp.AttrServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AttrController {
    @Autowired
    AttrServiceImp attrServiceImp;

    @RequestMapping("/get_attr_lists")
    public String get_attr_lists(int flbh2,ModelMap map){
        List<OBJECT_T_MALL_ATTR> list_attr = attrServiceImp.get_attr_list(flbh2);
        map.put("flbh2",flbh2);
        map.put("list_attr",list_attr);
        return "attrListInner";
    }

    @RequestMapping("/goto_attr")
    public String attr(){
        return "attr";
    }

    @RequestMapping("/goto_attr_add")
    public String goto_attrAdd(int flbh2, ModelMap model){
        model.put("flbh2",flbh2);
        return "attrAdd";
    }

    @RequestMapping("/attr_add")
    public ModelAndView attrAdd(int flbh2, MODEL_T_MALL_ATTR model_t_mall_attr){
        attrServiceImp.save_attr(flbh2,model_t_mall_attr.getList_attr());
        ModelAndView mv = new ModelAndView("redirect:goto_attr_add.do");
        mv.addObject("flbh2",flbh2);
        return mv;
    }
}
