package com.yayo.sys.controller.request;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

@Data
@ToString
public class RolePagingReuest implements Serializable {
    private static final long serialVersionUID = 5119972806135997275L;

    private Integer pageNo;
    private Integer pageSize;
    private String roleName;
    private String roleCode;

}
