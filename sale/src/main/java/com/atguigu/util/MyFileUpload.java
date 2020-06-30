package com.atguigu.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MyFileUpload {
    public static List<String> upload_image(MultipartFile[] files){
        String path =MyPropertyUtil.getProperty("myUpload.properties","windows_path");
        System.out.println(path);
        List<String> list_image = new ArrayList<String>();
        for(int i=0;i<files.length;i++){
            if(!files[i].isEmpty()){
                String originalFilename = files[i].getOriginalFilename();
                String name = System.currentTimeMillis() + originalFilename;
                String upload_name = path + "/" + name;//路径+文件名+时间戳
                try {
                    files[i].transferTo(new File(upload_name));
                    list_image.add(name);
                } catch (IOException e) {
                    e.printStackTrace();
                }


            }
        }
        return list_image;
    }
}
