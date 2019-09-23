package com.yayo.base.component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/21 0:30
 */
@Slf4j
@Component
public class UploadUtil {
    public static Map<String,String> upload(MultipartFile file, String filePath) {
        Map<String,String> result = new HashMap<>();
        if (file.isEmpty()) {
            return null;
        }

        // 获取文件名
        String fileName = file.getOriginalFilename();
        String uuidName = UUID.randomUUID().toString();
        log.info("上传的文件名为：{}" , fileName);

        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        log.info("上传的后缀名为：{}" , suffixName);

        // 解决中文问题，liunx下中文路径，图片显示问题
        // fileName = UUID.randomUUID() + suffixName;

        File dest = new File(filePath + uuidName + suffixName);

        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }

        try {
            file.transferTo(dest);
            result.put("code","0");
            result.put("msg","上传成功");
            result.put("path",filePath + uuidName + suffixName);
            return result;
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        result.put("code","-1");
        result.put("msg","上传失败");
        result.put("path","");
        return result;
    }

}
