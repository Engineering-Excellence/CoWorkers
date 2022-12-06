package com.silvertier.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.silvertier.service.BoardService;
import com.silvertier.service.EventService;
import com.silvertier.service.UserInfoService;
import com.silvertier.service.WorkService;

@WebServlet("*.sil")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
            case "/index.sil" -> viewPage += "login";

            // 로그인 화면
            case "/login.sil" -> viewPage += "login";

            // 로그인 정보 비교 페이지 => ID / PW 비교 후 mainView로 로그인 실행
            case "/loginOK.sil" -> {
                UserInfoService.getInstance().userInfoCompareID(request, response);
                UserInfoService.getInstance().userInfoComparePW(request, response);
                UserInfoService.getInstance().userInfoSelect(request, response);
//              UserInfoService.getInstance().userInfoSelectList(request, response);
                viewPage += "loginOK";
            }

            // 로그아웃 과정 진행 페이지 => 세션 제거 후 index.sil로 이동
            case "/logout.sil" -> viewPage += "logout";

            // 회원가입 페이지
            case "/registerForm.sil" -> viewPage += "registerForm";

            // 회원가입 완료 페이지
            case "/registerOK.sil" -> {
                UserInfoService.getInstance().userInfoInsert(request, response);
                viewPage += "login";
            }

            // coWorkers 메인 페이지
            case "/mainView.sil" -> {
                UserInfoService.getInstance().userInfoCompareID(request, response);
//                UserInfoService.getInstance().userInfoSelect(request, response);
                viewPage += "mainView";
            }

            /*
            case "/idPwFind.sil" -> viewPage += "idPwFind";

            case "/idFindOK.sil" -> {
                UserInfoService.getInstance().userInfoSelectList(request, response);
                UserInfoService.getInstance().userInfoSelectUser(request, response);
                UserInfoService.getInstance().userInfoCompareName(request, response);
                UserInfoService.getInstance().userInfoCompareID(request, response);
                UserInfoService.getInstance().userInfoCompareEmail(request, response);
                viewPage += "idFindView";
            }

            case "/pwFindOK.sil" -> viewPage += "pwFindView";
            */

            case "/file.sil" -> viewPage += "file";


            // Emma
            case "/event.sil" -> {
                System.out.println("event");
                try{
                	EventService.getInstance().eventInsert(request, response);
                } catch(Exception e){ }
                viewPage += "event";
            }

            case "/eventInsertOK.sil" -> {
                System.out.println("eventInsertOK");
                EventService.getInstance().eventSelectArrayList(request, response);
                EventService.getInstance().workSelectArrayList(request, response);
                viewPage += "eventOK";
            }

            case "/eventList.sil" -> {
                System.out.println("eventList");
                EventService.getInstance().eventSelectArrayList(request, response);
                EventService.getInstance().workSelectArrayList(request, response);
                viewPage += "eventList";
            }

            case "/eventView.sil" -> {
                System.out.println("eventView");
                EventService.getInstance().eventSelectArrayList(request, response);
                EventService.getInstance().eventSelectByEventID(request, response);
                viewPage += "eventView";
            }

            case "/eventUpdate.sil" -> {
                System.out.println("eventUpdate");
                EventService.getInstance().eventSelectByEventID(request, response);
                viewPage += "eventUpdate";
            }

            case "/eventUpdateOK.sil" -> {
                System.out.println("eventUpdateOK");
                EventService.getInstance().eventUpdate(request, response);
                EventService.getInstance().eventSelectArrayList(request, response);
                EventService.getInstance().workSelectArrayList(request, response);
                viewPage += "eventList";
            }

            case "/eventDelete.sil" -> {
                System.out.println("eventDelete");
                EventService.getInstance().eventDelete(request, response);
                EventService.getInstance().eventSelectArrayList(request, response);
                EventService.getInstance().workSelectArrayList(request, response);
                viewPage += "eventList";
            }


            // Anbin
            case "/work.sil" -> {
                viewPage += "work";
                WorkService.getInstance().workSelectList(request, response);
                WorkService.getInstance().workSelectPriority(request, response);
                System.out.println("work");
            }

            case "/workInsert.sil" -> {
                viewPage += "workInsert";
                System.out.println("workInsert");
            }

            case "/workInsertOK.sil" -> {
                WorkService.getInstance().workInsert(request, response);
                viewPage += "goWork";
                System.out.println("workInsertOK");
            }

            case "/workUpdate.sil" -> {
                WorkService.getInstance().workSelectByWorkID(request, response);
                viewPage += "workUpdate";
                System.out.println("workUpdate");
            }

            case "/workUpdateOK.sil" -> {
                viewPage += "goWork";
                WorkService.getInstance().workUpdate(request, response);
                System.out.println("workUpdateOK");
            }

            case "/workDelete.sil" -> {
                viewPage += "goWork";
                WorkService.getInstance().workDelete(request, response);
                System.out.println("workDelete");
            }

            case "/workView.sil" -> {
                viewPage += "workView";
                System.out.println("workView");
                WorkService.getInstance().workSelectList(request, response);
                WorkService.getInstance().workSelectByWorkID(request, response);
            }


            // Kyle
            case "/boardInsert.sil" ->
                // 글 작성 페이지를 호출한다.
                    viewPage += "boardInsert";

            case "/boardInsertOK.sil" -> {
                // 글을 작성하는 메서드를 호출한다.
                BoardService.getInstance().boardInsert(request, response);
                viewPage += "boardReturn";
            }

            case "/board.sil" -> {
                // 브라우저에 출력할 1 페이지 분량의 글과 페이징 작업에 사용할 8개의 변수가 저장된 클래스 객체를
                // 얻어오는 메소드를 호출한다.
                BoardService.getInstance().boardSelectList(request, response);
                viewPage += "board";
            }

            case "/boardHit.sil" -> {
                // 조회수를 증가시키는 메서드를 호출한다.
                BoardService.getInstance().boardHit(request, response);
                viewPage += "boardHit";
            }

            case "/boardView.sil" -> {
                // 조회수를 증가시킨 글 1건을 얻어오는 메서드를 호출한다.
                BoardService.getInstance().boardSelectByPostID(request, response);
                viewPage += "boardView";
            }

            case "/boardUpdate.sil" -> {
                // 글 수정 페이지를 호출한다.
                BoardService.getInstance().boardSelectByPostID(request, response);
                viewPage += "boardUpdate";
            }

            case "/boardUpdateOK.sil" -> {
                // 글 1건을 수정하는 메서드를 호출한다.
                BoardService.getInstance().boardUpdate(request, response);
                viewPage += "boardViewReturn";
            }

            case "/boardDelete.sil" -> {
                // 글 1건을 삭제하는 메서드를 호출한다.
                BoardService.getInstance().boardDelete(request, response);
                viewPage += "boardReturn";
            }

            case "/boardCommentOK.sil" -> {
                // 댓글을 조작하는 메서드를 호출한다.
                String mode = request.getParameter("mode");
                switch (mode) {
                    case "insert" -> // 댓글 삽입
                            BoardService.getInstance().boardCommentInsert(request, response);
                    case "update" -> // 댓글 수정
                            BoardService.getInstance().boardCommentUpdate(request, response);
                    default -> {
                    }
                }
                viewPage += "boardViewReturn";
            }

            case "/boardCommentDelete.sil" -> {
                BoardService.getInstance().boardCommentDelete(request, response);
                viewPage += "boardViewReturn";
            }

            default -> viewPage += "error";
        }
        viewPage += ".jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }


}
