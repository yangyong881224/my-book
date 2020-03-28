package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.dto.UserRoleDTO;
import com.yayo.sys.service.UserRoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/admin/user/role")
@Slf4j
@RestController
public class UserRoleController {

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping(value = "/paging" , method = RequestMethod.GET)
    public Paging<UserRoleDTO> paging(Integer pageSize,Integer pageNo){

        return userRoleService.paging(pageSize,pageNo);
    }
}
