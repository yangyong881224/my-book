package com.yayo.base.utils;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 18:53
 */
@Data
public class Paging<T> {

    private Integer total ;
    private List<T> list;

    public static Paging empty(){
        Paging paging = new Paging<>();
        paging.setTotal(0);
        paging.setList(new ArrayList());
        return paging;
    }

    public Paging(){

    }

    public Paging(Integer total,List<T> list){
        this.total = total;
        this.list = list;
    }

}
