package com.yayo.sys.controller;

import com.yayo.base.component.RequestContext;
import com.yayo.base.utils.Paging;
import com.yayo.sys.controller.info.UserInfo;
import com.yayo.sys.controller.dto.RoleDTO;
import com.yayo.sys.controller.request.RoleCreateRequest;
import com.yayo.sys.controller.request.RolePagingReuest;
import com.yayo.sys.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api/admin/role")
@Slf4j
@RestController
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping("/paging")
    public Paging<RoleDTO> paging(RolePagingReuest rolePagingReuest){
        return roleService.paging(rolePagingReuest);
    }

    @PostMapping("/create")
    public Boolean createRole(RoleCreateRequest roleCreateRequest){
        return roleService.create(roleCreateRequest);
    }

    @GetMapping("/get")
    public RoleDTO getOne(Long id){
        return roleService.findById(id);
    }

    @PutMapping("/delete")
    public Boolean delete(Long roleId){
        return roleService.delete(roleId,RequestContext.getUserId());
    }

    @GetMapping("/list_all")
    public List<RoleDTO> listAll(){
        return roleService.listAll();
    }

    @GetMapping("/check_user")
    public UserInfo checkUser(String username){
        return roleService.checkUser(username);
    }
}
