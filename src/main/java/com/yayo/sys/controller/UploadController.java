package com.yayo.sys.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/api/admin/upload")
public class UploadController {

    @Value("${upload.filePath.userIcon}")
    private String userIcon;

    @Value("${upload.filePath.miscIcon}")
    private String miscIcon;

    @PostMapping("/image")
    public String uploadIcon(MultipartFile image , String fileType, HttpServletRequest request){
        String path = "";
        if("userIcon".equals(fileType)){
            path = userIcon;
        }else if ("miscIcon".equals(fileType)){
            path = miscIcon;
        }
        if(image.isEmpty()){
            throw new RuntimeException("miscIcon.upload.null");
        }
        String imageName = UUID.randomUUID() + image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
        String realPath = request.getSession().getServletContext().getRealPath(path + imageName);
        try {
            image.transferTo(new File(realPath));
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }

        return path + imageName;
    }
}
