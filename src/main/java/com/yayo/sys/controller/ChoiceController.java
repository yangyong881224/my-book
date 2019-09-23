package com.yayo.sys.controller;

import com.yayo.base.component.UploadUtil;
import com.yayo.base.utils.Paging;
import com.yayo.sys.bean.Choice;
import com.yayo.sys.bean.User;
import com.yayo.sys.dto.ChoiceDTO;
import com.yayo.sys.dto.ChoiceUpdateDTO;
import com.yayo.sys.service.ChoiceService;
import com.yayo.sys.utils.ReadChoice;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/19 11:32
 */

@RestController
@RequestMapping(value = "/api/admin/choice")
@Slf4j
public class ChoiceController {

    @Autowired
    private ChoiceService choiceService;

    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public Paging<ChoiceDTO> list(Integer pageSize , Integer pageNo){
        Map<String,Object> params = new HashMap<>();
        params.put("pageSize",pageSize);
        params.put("pageNo",pageNo);
        return choiceService.paging(params);
    }

    @RequestMapping(value = "/create" , method = RequestMethod.POST)
    public boolean create(Choice choice , HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null){
            choice.setCreatedBy(user.getUserId());
        }else{
            return false;
        }
        return choiceService.create(choice);
    }

    @RequestMapping(value = "/create_batch" , method = RequestMethod.POST)
    public Map<String,String> createBatch(MultipartFile file){
        Map<String,String> result = choiceService.uploadAndRead(file);
        return result;
    }

    @RequestMapping(value = "/delete" , method = RequestMethod.DELETE)
    public boolean delete(Long choiceId){
        return choiceService.delete(choiceId);
    }

    @RequestMapping(value = "/{choiceId}" , method = RequestMethod.GET)
    public ChoiceUpdateDTO getChoiceById(@PathVariable Long choiceId){
        return choiceService.getChoiceById(choiceId);
    }

    @RequestMapping(value = "/update" , method =  RequestMethod.PUT)
    public boolean update(Choice choice){
        return choiceService.update(choice);
    }
}
