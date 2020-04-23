package com.yayo.sys.controller;

import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.dto.UserRoleDTO;
import com.yayo.sys.controller.request.UserRoleCreateRequest;
import com.yayo.sys.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/admin/role_user")
public class UserRoleController {

    @Autowired
    private UserRoleService userRoleService;

    @GetMapping("/paging")
    public Paging<UserRoleDTO> paging(Integer pageNo, Integer pageSize){
        return userRoleService.paging(pageNo,pageSize);
    }

    @PostMapping("/create_or_update")
    public Boolean createOrUpdate(UserRoleCreateRequest userRoleCreateRequest){
        return userRoleService.createOrUpdate(userRoleCreateRequest);
    }

    @DeleteMapping("/delete")
    public Boolean delete(Long id){
        return userRoleService.deleteById(id);
    }
}
