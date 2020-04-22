package com.yayo.sys.service;

import com.yayo.base.utils.Paging;
import com.yayo.sys.mapper.dataobject.Choice;
import com.yayo.sys.controller.dto.ChoiceDTO;
import com.yayo.sys.controller.dto.ChoiceUpdateDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/19 11:35
 */
public interface ChoiceService {
    Paging<ChoiceDTO> paging(Map<String, Object> params);

    boolean create(Choice choice);

    boolean delete(Long choiceId);

    ChoiceUpdateDTO getChoiceById(Long choiceId);

    boolean update(Choice choice);

    Map<String, String> uploadAndRead(MultipartFile file);

    Paging<ChoiceDTO> paperChoiceList(Integer pageNo, Integer pageSize, List<Long> choiceIds);

    List<Choice> getChoiceByIds(List<Long> choiceIdList);
}
