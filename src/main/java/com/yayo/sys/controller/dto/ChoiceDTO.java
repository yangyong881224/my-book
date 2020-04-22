package com.yayo.sys.controller.dto;

import com.yayo.sys.mapper.dataobject.Categories;
import com.yayo.sys.mapper.dataobject.Choice;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author: Yayo
 * @Description:习题展示
 * @Created at: 2019/9/19 8:39
 */
@Data
public class ChoiceDTO implements Serializable {

    private static final long serialVersionUID = -1179663475200501175L;
    /**
     * 一级类目
     */
    private Categories categories1;
    /**
     * 二级类目
     */
    private Categories categories2;
    /**
     * 习题
     */
    private Choice choice;
}
