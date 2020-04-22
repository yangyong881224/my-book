package com.yayo.user.controller;

import com.yayo.base.utils.Paging;
import com.yayo.user.dto.ChoiceExameDTO;
import com.yayo.user.dto.PaperDTO;
import com.yayo.user.facade.UserPaperReadFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user/api/study")
public class UserPaperController {

    @Autowired
    private UserPaperReadFacade userPaperReadFacade;

    @GetMapping("/paging")
    public Paging<PaperDTO> paging(Integer pageNo , Integer pageSize){
        return userPaperReadFacade.paging(pageNo,pageSize);
    }

    @PostMapping("/exam")
    public List<ChoiceExameDTO> makeExam(Long paperId){
        return userPaperReadFacade.makeExam(paperId);
    }
}
