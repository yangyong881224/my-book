package com.yayo.base.utils;

import lombok.Data;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 9:51
 */
@Data
public class PageInfo {
    public static final String LIMIT = "limit";
    public static final String OFFSET = "offset";
    private Integer offset;
    private Integer limit;

    public PageInfo() {
    }

    public static PageInfo of(Integer pageNo, Integer size) {
        return new PageInfo(pageNo, size);
    }

    public PageInfo(Integer pageNo, Integer size) {
        pageNo = pageNo == null ? 1 : pageNo;
        size = size == null ? 10 : size;
        this.limit = size > 0 ? size : 10;
        this.offset = (pageNo - 1) * size;
        this.offset = this.offset > 0 ? this.offset : 0;
    }
}
