package com.crunch.controller;

import com.crunch.domain.MemoDTO;
import com.crunch.domain.MemoList;
import com.crunch.domain.UserInfoDTO;
import com.crunch.service.MemoService;
import com.crunch.service.UserInfoService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.HashMap;

@Controller
@Slf4j
@AllArgsConstructor
public class MemoController {

    private MemoService service;
    private MemoList memoList;
    private UserInfoService userInfoService;

    @GetMapping(value = "memo")
    public String memo(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                       Model model, @SessionAttribute("userInfo") UserInfoDTO userInfo) {
        log.info("MemoController memo()");
        int pageSize = 10;
        int totalCount = service.memoReceiverCount(userInfo.getUserID());
//        log.info("totalCount: " + totalCount);
        memoList.initMemoList(pageSize, totalCount, currentPage);
        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("userID", userInfo.getUserID());
        hashMap.put("startNo", memoList.getStartNo());
        hashMap.put("endNo", memoList.getEndNo());
//        log.info("hashMap: " + hashMap);
        memoList.setList(service.memoList(hashMap));
        model.addAttribute("memoList", memoList);
//        log.info("memoList: " + memoList);

        return "memo/memo";
    }

    @GetMapping(value = "trash")
    public String trash(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                        Model model, @SessionAttribute("userInfo") UserInfoDTO userInfo) {
        log.info("MemoController trash()");
        int pageSize = 10;
        int totalTrashCount = service.memoSelectDeleteCount(userInfo.getUserID());
        memoList.initMemoList(pageSize, totalTrashCount, currentPage);
        HashMap<String,Integer> hashMap = new HashMap<>();
        hashMap.put("userID", userInfo.getUserID());
        hashMap.put("startNo", memoList.getStartNo());
        hashMap.put("endNo", memoList.getEndNo());
        memoList.setList(service.memoDeletedList(hashMap));
        log.info("memoList: " + memoList);
        model.addAttribute("memoDeletedList", memoList);

        return "memo/trash";
    }
    @GetMapping(value = "new")
    public String newMemo(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                          Model model, @SessionAttribute("userInfo") UserInfoDTO userInfo) {
        log.info("MemoController newMemo()");
        int pageSize = 10;
        int totalNewCount = service.memoSelectNewCount(userInfo.getUserID());
        memoList.initMemoList(pageSize, totalNewCount, currentPage);
        HashMap<String,Integer> hashMap = new HashMap<>();
        hashMap.put("userID", userInfo.getUserID());
        hashMap.put("startNo", memoList.getStartNo());
        hashMap.put("endNo", memoList.getEndNo());
        memoList.setList(service.memoNewList(hashMap));
        log.info("memoList: " + memoList);
        model.addAttribute("memoNewList", memoList);
        return "memo/new";
    }
    @GetMapping(value = "important")
    public String important(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                            Model model, @SessionAttribute("userInfo") UserInfoDTO userInfo) {
        log.info("MemoController important()");
        int pageSize = 10;
        int totalCount = service.memoSelectImportantCount(userInfo.getUserID());
        memoList.initMemoList(pageSize, totalCount, currentPage);
        HashMap<String,Integer> hashMap = new HashMap<>();
        hashMap.put("userID", userInfo.getUserID());
        hashMap.put("startNo", memoList.getStartNo());
        hashMap.put("endNo", memoList.getEndNo());
        memoList.setList(service.memoImportantList(hashMap));
        log.info("memoList: " + memoList);
        model.addAttribute("memoImportantList", memoList);
        return "memo/important";
    }
    @GetMapping(value = "marked")
    public String marked(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                         Model model, @SessionAttribute("userInfo") UserInfoDTO userInfo) {
        log.info("MemoController marked()");
        int pageSize = 10;
        int totalMarkCount = service.memoSelectMarkedCount(userInfo.getUserID());
        memoList.initMemoList(pageSize, totalMarkCount, currentPage);
        HashMap<String,Integer> hashMap = new HashMap<>();
        hashMap.put("userID", userInfo.getUserID());
        hashMap.put("startNo", memoList.getStartNo());
        hashMap.put("endNo", memoList.getEndNo());
        memoList.setList(service.memoMarkedList(hashMap));
        log.info("memoList: " + memoList);
        model.addAttribute("memoMarkedList", memoList);
        return "memo/marked";
    }

    @GetMapping(value = "memoView")
    public String memoView(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                           @RequestParam(value = "memoID") int memoID, MemoDTO memoDTO, Model model) {
        log.info("MemoController memoView()");
        log.info("memoID: " + memoID);
        memoDTO = service.selectByMemoID(memoID);
        service.memoRead(memoID);
        model.addAttribute("mDTO", memoDTO);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("enter", "\r\n");
        log.info(memoDTO.getSubject());
        model.addAttribute("subject", memoDTO.getSubject());
        return "memo/memoView";
    }
    @GetMapping(value = "newView")
    public String newView(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                           @RequestParam(value = "memoID") int memoID, MemoDTO memoDTO, Model model) {
        log.info("MemoController memoView()");
        log.info("memoID: " + memoID);
        memoDTO = service.selectByMemoID(memoID);
        service.memoRead(memoID);
        model.addAttribute("mDTO", memoDTO);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("enter", "\r\n");
        log.info(memoDTO.getSubject());
        model.addAttribute("subject", memoDTO.getSubject());
        return "memo/newView";
    }
    @GetMapping(value = "return")
    public String returnMemo() {
        log.info("MemoController returnMemo()");
        return "redirect:new";
    }

    @PostMapping(value = "memoReply")
    public String memoReply(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                            @RequestParam(value = "memoID") int memoID, MemoDTO memoDTO, Model model) {

        memoDTO = service.selectByMemoID(memoID);
        model.addAttribute("mDTO", memoDTO);
        log.info("MemoController memoReply()");
        return "memo/memoReply";
    }

    @GetMapping(value = "memoInsert")
    public String memoInsert() {

        log.info("MemoController memoInsert()");


        return "memo/memoInsert";
    }

    @PostMapping(value = "memoInsertOK")
    public String memoInsertOK(MemoDTO memoDTO) {

        log.info("MemoController memoInsertOK()");
        log.info("memoDTO: " + memoDTO);
        log.info("userInfo: " + memoDTO.getAccountID());

        int receiverID = userInfoService.selectUserID(memoDTO.getAccountID());
        log.info("receiverID: " + receiverID);
        memoDTO.setReceiverID(receiverID);
        service.insert(memoDTO);
        log.info("memoDTO: " + memoDTO);

        return "redirect:memo";
    }

    @GetMapping(value = "memoDelete")
    public String memoDelete(@RequestParam("memoID") int memoID) {
        service.delete(memoID);
        log.info("MemoController memoDelete()");
        return "redirect:memo";
    }

    @GetMapping(value = "memoDeleteOK")
    public String memoDeleteOK(@RequestParam("memoID") int memoID) {
        service.deleteOK(memoID);
        log.info("MemoController memoDeleteOK()");
        return "redirect:trash";
    }

    @GetMapping(value = "memoRestore")
    public String memoRestore(@RequestParam("memoID") int memoID) {
        log.info("MemoController memoRestore()");
        service.memoRestore(memoID);
        return "redirect:trash";
    }
    @GetMapping(value = "trashView")
    public String trashView(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                           @RequestParam(value = "memoID") int memoID, MemoDTO memoDTO, Model model) {
        log.info("MemoController memoView()");
        log.info("memoID: " + memoID);
        memoDTO = service.selectByMemoID(memoID);
        model.addAttribute("mDTO", memoDTO);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("enter", "\r\n");
        log.info(memoDTO.getSubject());
        model.addAttribute("subject", memoDTO.getSubject());
        return "memo/trashView";
    }
    @GetMapping(value = "memoMark")
    public String memoMark(@RequestParam("memoID") int memoID) {
        log.info("MemoController memoMark()");
        service.mark(memoID);
        return "redirect:memo";
    }
    @GetMapping(value = "memoMarkGG")
    public String memoMarkGG(@RequestParam("memoID") int memoID) {
        log.info("MemoController memoMark()");
        service.markGG(memoID);
        return "redirect:marked";
    }
    @GetMapping(value = "markedView")
    public String markedView(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                            @RequestParam(value = "memoID") int memoID, MemoDTO memoDTO, Model model) {
        log.info("MemoController markedView()");
        log.info("memoID: " + memoID);
        memoDTO = service.selectByMemoID(memoID);
        model.addAttribute("mDTO", memoDTO);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("enter", "\r\n");
        log.info(memoDTO.getSubject());
        model.addAttribute("subject", memoDTO.getSubject());
        return "memo/markedView";
    }
}
