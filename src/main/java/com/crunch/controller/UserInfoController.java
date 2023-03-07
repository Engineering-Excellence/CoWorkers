package com.crunch.controller;

import com.crunch.domain.UserInfoDTO;
import com.crunch.service.UserInfoService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import java.util.List;

@Controller
@AllArgsConstructor
@SessionAttributes({"userInfo","userID"})
@Slf4j
@RequestMapping("/")
public class UserInfoController {

    private UserInfoService service;
    private UserInfoDTO userInfoDTO;

    @RequestMapping(value = "")
    public String login() {

        log.info("UserInfoController의 login() 실행");

        return "/userInfo/login";
    }

    // ID/PW 찾기 결과화면에서 로그인으로 넘어오는 메소드
    @GetMapping(value = "moveLogin")
    public String moveLogin() {
    	
    	log.info("main ida");
    	
    	return "redirect:/";
    }
    
    // 로그인 처리를 위해 ID/PW 비교하는 메소드
    @PostMapping(value = "loginOK")
    public String loginOK(Model model,
                          @RequestParam("accountID") String accountID,
                          @RequestParam("accountPassword") String accountPassword) {

        log.info("UserInfoController의 loginOK() 실행");

        String originID = service.compareID(accountID);
        String originPassword = service.comparePW(accountID);

        if (accountID != null && accountID.equals(originID)) {

            if (accountPassword != null && accountPassword.equals(originPassword)) {

                userInfoDTO.setAccountID(accountID);
                List<UserInfoDTO> userInfo = service.select(accountID);

                model.addAttribute("userInfoDTO", userInfoDTO);
                model.addAttribute("userInfo", userInfo);
                model.addAttribute("userID", userInfo.get(0).getUserID());

                return "userInfo/mainView";
            } else {

                model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");

                return "redirect:/";
            }
        } else {

            model.addAttribute("msg", "아이디가 틀렸습니다.");

            return "redirect:/";
        }

    }

    // 로그아웃 시 세션무효화 및 로그인화면으로 이동하는 메소드
    @GetMapping(value = "logout")
    public String logout(SessionStatus sessionStatus) {
        //        HttpSession ⇒ invalidate(), removeAttribute("key")
        //        HttpSession 객체를 생성하여 세션에 저장한 데이터의 경우(=@SessionAttribute에 등록하지 않은 경우),
        //        HttpSession의 invalidate() 메소드를 통해 세션 데이터 일괄 삭제
        //        혹은 removeAttribute("key") 메소드를 통해 특정 키 값의 세션 데이터 삭제
        //
        //        @SessionAttribute ⇒ setComplete()
        //        @SessionAttribute에 데이터 키 값을 등록하여, 스프링 API가 관리하는 세션 데이터로 설정한 경우,
        //        SessionStatus 객체인 SessionStatus status 생성하여 파라미터로 넘기고
        //        status.setComplete() 메소드를 통해 스프링 API 관리 세션 데이터 일괄 삭제

        //        session.invalidate();  // 세션 무효화 방법 1
        //        session.removeAttribute("userInfo");  // 세션 무효화 방법 2
        //        sessionStatus.setComplete();    // 세션 무효화 방법 3
        log.info("UserInfoController의 logout() 실행");

        sessionStatus.setComplete();    // 세션 제거

        return "redirect:/";
    }

    // 회원가입 화면 이동 메소드
    @GetMapping(value = "registerForm")
    public String registerForm() {

        log.info("UserInfoController의 registerForm() 실행");

        return "userInfo/registerForm";
    }

    // 회원가입 확인 처리 메소드
    @Transactional
    @PostMapping(value = "registerOK")
    public String registerOK(UserInfoDTO userInfoDTO) {

        log.info("UserInfoController의 registerOK() 실행");
        
        // log.info("before userInfodto: " + userInfoDTO);
        try {
        	service.insert(userInfoDTO);
        } catch (Exception e) {
        	log.info("insert 과정에서 에러 발생");
        	return "userInfo/registerForm";
        }

        // log.info("after userInfodto: " + userInfoDTO);

        return "redirect:/";
    }

    // mainView 호출 메소드
    @GetMapping(value = "mainView")
    public String mainView() {

        log.info("UserInfoController의 mainView() 실행");

        return "userInfo/mainView";
    }
    
 // 내 프로필 호출 메소드
    @GetMapping(value = "userProfile")
    public String userProfile(Model model) {
    	
    	log.info("UserInfoController의 userProfile() 실행");
    	
    	return "userInfo/userProfile";
    }
    
    // 사원목록 호출 메소드
    @GetMapping(value = "userAllMember")
    public String userAllMember(Model model) {
    	
    	log.info("UserInfoController의 userAllMember() 실행");
    	
    	List<UserInfoDTO> list = service.getUserInfoList();
    
    	log.info("userAllMember List: " + list);
    	
    	model.addAttribute("list", list);
    	
    	return "userInfo/userAllMember";
    }
    
    // ID 중복확인 메소드
    @PostMapping(value = "idCheck")
    @ResponseBody
    public int idCheck(@RequestBody String accountID) {
    	
    	log.info("UserInfoController의 idCheck() 실행");
//    	log.info("UserInfoController의 ID before: " + accountID);
    	
    	int idResult = service.accountIDCount(accountID);
    	
//    	log.info("controller ID: " + accountID);
//    	log.info("controller idResult : " + idResult);
    	
		return idResult;
    }
    
    // 주민등록번호 중복검사 메소드
    @PostMapping(value = "regCheck")
    @ResponseBody
    public Integer regCheck(@RequestBody String registerNumber) {
    	
    	log.info("UserInfoController의 regCheck() 실행");
    	
    	int regResult = service.registerNumberCount(registerNumber);
    	
//    	log.info("controller regResult : " + regResult);
    	
    	return regResult;
    }
    
    // ID 찾기 화면 호출 메소드
    @GetMapping(value = "idFindView")
    public String idFindView(Model model) {
    	
    	log.info("UserInfoController의 idFindView() 실행");
    	
    	return "userInfo/idFindView";
    }
    
    // ID 찾기 처리 메소드
    @PostMapping(value = "idFindOK")
    public String idFindOK(Model model,
    					   @RequestParam("userName") String userName,
    					   @RequestParam("email") String email) {

    	log.info("UserInfoController의 idFindOK() 실행");
    	
    	String idFindByName = service.findIdByName(userName);
    	String idFindByEmail = service.findIdByMail(email);
    	
//    	log.info("idFindByName :" + idFindByName + ", idFindByEmail :" + idFindByEmail);
    	
    	if (idFindByName.equals(idFindByEmail)) {
    		model.addAttribute("accountID", idFindByName);
    		return "userInfo/idFindOKView";
    	} else if (!idFindByName.equals(idFindByEmail)) {
    		model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
    		return "redirect:userInfo/idFindView";
    	}
	return "userInfo/idFindOKView";
    }
    
    // ID 찾기 결과 화면 호출 메소드
    @GetMapping(value = "idFindOKView")
    public String idFindOKView(Model model) {
    	
    	log.info("UserInfoController의 idFindOKView() 실행");
    	
    	return "userInfo/idFindOKView";
    }
    
    // PW 찾기 화면 호출 메소드
    @GetMapping(value = "pwFindView")
    public String pwFindView(Model model) {
    	
    	log.info("UserInfoController의 pwFindView() 실행");
    	
    	return "userInfo/pwFindView";
    }
    
    // PW 찾기 처리 메소드
    @PostMapping(value = "pwFindOK")
    public String pwFindOK(Model model,
    					   @RequestParam(value="accountID", required=false) String accountID,
    					   @RequestParam(value="userName", required=false) String userName,
    					   @RequestParam(value="email", required=false) String email) {
    	
    	log.info("UserInfoController의 pwFindOK() 실행");

    	String pwFindByID = service.findPwById(accountID);
//    	log.info(pwFindByID);
    	
    	String pwFindByName = service.findPwByName(userName);
//    	log.info(pwFindByName);
    	
    	String pwFindByEmail = service.findPwByMail(email);
//    	log.info(pwFindByEmail);
    	
//    	log.info("pwFindByID :" + pwFindByID + ", pwFindByName :" + pwFindByName + ", pwFindByEmail :" + pwFindByEmail);
    	
    	if (pwFindByID.equals(pwFindByName)) {
    		if (pwFindByID.equals(pwFindByEmail)) {
    			model.addAttribute("accountPassword", pwFindByID);
    			return "userInfo/pwFindOKView";
    		}
    	} else if (!pwFindByID.equals(pwFindByEmail) || !pwFindByID.equals(pwFindByName)) {
    		model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다.");
    		return "redirect:userInfo/pwFindView";
    	}
	return "userInfo/pwFindOKView";
    }
    
    // PW 찾기 결과 화면 호출 메소드
    @GetMapping(value = "pwFindOKView")
    public String pwFindOKView(Model model) {
    	
    	log.info("UserInfoController의 pwFindOKView() 실행");
    	
    	return "userInfo/pwFindOKView";
    }
    
}
