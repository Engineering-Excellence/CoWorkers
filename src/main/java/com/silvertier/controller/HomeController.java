package com.silvertier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.silvertier.dto.UserInfoDTO;
import com.silvertier.service.BoardService;
import com.silvertier.service.EventService;
import com.silvertier.service.UserInfoService;
import com.silvertier.service.WorkService;

@WebServlet("*.sil")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 김태형 (Terry) - 로그인, 홈 화면 분기 컨트롤러

    UserInfoService service = UserInfoService.getInstance();

    public HomeController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HomeController -> doGet");
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HomeController -> doPost");
        process(request, response);
    }

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HomeController -> process");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String url = request.getRequestURI();
        String contextPath = request.getContextPath();
        String context = url.substring(contextPath.length());
        String viewPage = "/WEB-INF/";

        switch (context) {

            // Terry
         	// 초기 index화면 => 바로 login.sil로 진입
            case "/index.sil":
                viewPage += "login";
                break;
                
            // 로그인 화면
            case "/login.sil":
                viewPage += "login";
                break;
                
            // 로그인 정보 비교 페이지 => ID / PW 비교 후 mainView로 로그인 실행
            case "/loginOK.sil":
                UserInfoService.getInstance().userInfoCompareID(request, response);
                UserInfoService.getInstance().userInfoComparePW(request, response);
                viewPage += "loginOK";
                break;
               
            // 로그아웃 과정 진행 페이지 => 세션 제거 후 index.sil로 이동
            case "/logout.sil":
                viewPage += "logout";
                break;

            // 회원가입 페이지
            case "/registerForm.sil":
                viewPage += "registerForm";
                break;
            
            // 회원가입 완료 페이지
            case "/registerOK.sil":
                UserInfoService.getInstance().userInfoInsert(request, response);
                viewPage += "login";
                break;
                
            // coWorkers 메인 페이지    
            case "/mainView.sil":
                viewPage += "mainView";
                break;

            
             /* -- Terry, ID/PW 찾기 (추후 업데이트 - 스프링 학습 이후)
            case "/idPwFind.sil":
                viewPage += "idPwFind";
                break;
			
                -- Terry, ID 찾기 (추후 업데이트 - 스프링 학습 이후)
			 case "/idFindOK.sil":
			 UserInfoService.getInstance().userInfoSelectList(request, response);
			 UserInfoService.getInstance().userInfoSelectUser(request, response);
			 UserInfoService.getInstance().userInfoCompareName(request, response);
			 UserInfoService.getInstance().userInfoCompareID(request, response);
			 UserInfoService.getInstance().userInfoCompareEmail(request, response);
			 viewPage += "idFindView"; break;
			 
                -- Terry, pw 찾기 (추후 업데이트 - 스프링 학습 이후) 
            case "/pwFindOK.sil":
            	viewPage += "pwFindView";
            	break;
			*/
                
            case "/board.sil":
                viewPage += "board";
                break;

            /*case "/work.sil":
                viewPage += "work";
                break;*/

            case "/file.sil":
                viewPage += "file";
                break;

            /*case "/event.sil":
                viewPage += "event";
                break;*/

            // Emma
            case "/event.sil":
                viewPage += "event";
                break;

            case "/eventInsertOK.sil":
                EventService.getInstance().eventInsert(request, response);
                viewPage += "event";
                break;

            // Anbin
            case "/work.sil":
                viewPage += "work";
                WorkService.getInstance().workSelectList(request, response);
                WorkService.getInstance().workSelectPriority(request, response);
                System.out.println("work");
                break;
            case "/workInsert.sil":
                viewPage += "workInsert";
                System.out.println("workInsert");
                break;
            case "/workInsertOK.sil":
                WorkService.getInstance().workInsert(request, response);
                viewPage += "goWork";
                System.out.println("workInsertOK");
                break;
            case "/workUpdate.sil":
                WorkService.getInstance().workSelectByWorkID(request, response);
                viewPage += "workUpdate";
                System.out.println("workUpdate");
                break;
            case "/workUpdateOK.sil":
                viewPage += "goWork";
                WorkService.getInstance().workUpdate(request, response);
                System.out.println("workUpdateOK");
                break;
            case "/workDelete.sil":
                viewPage += "goWork";
                WorkService.getInstance().workDelete(request, response);
                System.out.println("workDelete");
                break;
            case "/workView.sil":
                viewPage += "workView";
                System.out.println("workView");
                WorkService.getInstance().workSelectList(request, response);
                WorkService.getInstance().workSelectByWorkID(request, response);
                break;

            // Kyle
            case "/boardInsert.sil":
                viewPage += "boardInsert";
                break;
            case "/boardInsertOK.sil":
                BoardService.getInstance().boardInsert(request, response);
//                service.selectList(request, response);
                viewPage += "boardReturn";
                break;
            case "/boardList.sil":
                // 브라우저에 출력할 1 페이지 분량의 글과 페이징 작업에 사용할 8개의 변수가 저장된 클래스 객체를
                // 얻어오는 메소드를 호출한다.
                BoardService.getInstance().boardSelectNotice(request, response);
                BoardService.getInstance().boardSelectList(request, response);
                viewPage += "boardList";
                break;
            case "/boardHit.sil":
                // 조회수를 증가시키는 메서드를 호출한다.
                BoardService.getInstance().boardHit(request, response);
                viewPage += "boardHit";
                break;
            case "/boardView.sil":
                // 조회수를 증가시킨 글 1건을 얻어오는 메서드를 호출한다.
                BoardService.getInstance().boardSelectByPostID(request, response);
                viewPage += "boardView";
                break;
            case "/boardUpdate.sil":
                // 글 1건을 수정하는 메서드를 호출한다.
//                BoardService.getInstance().update(request, response);
                viewPage += "boardReturn";
                break;
            case "/boardDelete.sil":
                // 글 1건을 삭제하는 메서드를 호출한다.
                BoardService.getInstance().boardDelete(request, response);
                viewPage += "boardReturn";
                break;
            case "/boardCommentOK.sil":
//                BoardService.getInstance().selectByPostID(request, response);
                viewPage += "boardView";
                break;

            default:
                viewPage += "error";
                break;
        }
        viewPage += ".jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }


}
