package com.yayo.sys.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/18 8:54
 */
@Data
public class Categories implements Serializable {
    private static final long serialVersionUID = -6105702433840552548L;

    private Integer categoriesId;
    private String categoriesName;
    private Integer categoriesParent;

}
