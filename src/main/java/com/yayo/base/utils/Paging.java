package com.yayo.base.utils;

import com.google.common.collect.Lists;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/16 18:53
 */
@Data
@EqualsAndHashCode
@ToString
public class Paging<T> {

    private Long total;
    private List<T> data;

    public Paging() {
    }

    public Paging(Long total, List<T> data) {
        this.data = data;
        this.total = total;
    }

    public Boolean isEmpty() {
        return Objects.equals(0L, this.total) || this.data == null || this.data.isEmpty();
    }

    public static <T> Paging<T> empty(Class<T> clazz) {
        List<T> emptyList = Collections.emptyList();
        return new Paging(0L, emptyList);
    }

    public static <T> Paging<T> empty() {
        return new Paging(0L, Collections.emptyList());
    }

}
