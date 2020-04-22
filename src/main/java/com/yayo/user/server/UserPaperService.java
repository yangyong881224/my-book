package com.yayo.user.server;

import com.yayo.user.dto.PaperDTO;
import com.yayo.user.request.UserPaperRequest;

public interface UserPaperService {
    Boolean updateUserPaper(UserPaperRequest userPaperRequest);

    void create(Long paperId, Long userId);
}
