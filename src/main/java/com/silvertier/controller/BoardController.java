package com.silvertier.controller;

import com.silvertier.service.BoardService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

// Kyle
@WebServlet(name = "BoardController", value = "*.sil")
public class BoardController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // 컨트롤러에서 사용할 service 클래스 객체를 생성한다.
    private final BoardService service = BoardService.getInstance();

    public BoardController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("BoardController 클래스의 doGet() 메서드 실행");
        process(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("BoardController 클래스의 doPost() 메서드 실행");
        process(request, response);
    }

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("BoardController 클래스의 process() 메서드 실행");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // 주소창에 입력된 컨텍스트 패스와 요청을 받아온다.
        String url = request.getRequestURI();
        String contextPath = request.getContextPath();
        String context = url.substring(contextPath.length());
        System.out.println(context);

        // ===========================================================================================================

        // 요청에 따른 분기할 페이지를 결정한다.
        String viewPage = "/WEB-INF/";
        switch (context) {
            case "/boardInsert.sil":
                viewPage += "boardInsert";
                break;
            case "/boardInsertOK.sil":
                /*
                    boardInsert.jsp에서 테이블에 저장할 데이터를 입력하고 submit 버튼을 클릭하면 폼에 입력한 정보가
                    Controller의 doPost() 메서드의 HttpServletRequest 인터페이스 타입의 객체인 request에 저장된다.
                    doPost() 메서드는 request 객체에 저장된 데이터를 가지고 process() 메서드를 실행하므로
                    boardInsert.jsp에서 폼에 입력한 데이터는 process() 메서드의 request 객체에 저장된다.
                 */
                service.insert(request, response);
//                service.selectList(request, response);

                viewPage += "boardReturn";
                break;
            case "/boardList.sil":
                // 브라우저에 출력할 1 페이지 분량의 글과 페이징 작업에 사용할 8개의 변수가 저장된 클래스 객체를
                // 얻어오는 메소드를 호출한다.
                service.selectNotice(request, response);
                service.selectList(request, response);
                viewPage += "boardList";
                break;
            case "/boardHit.sil":
                // 조회수를 증가시키는 메서드를 호출한다.
                service.hit(request, response);
                viewPage += "boardHit";
                break;
            case "/boardView.sil":
                // 조회수를 증가시킨 글 1건을 얻어오는 메서드를 호출한다.
                service.selectByPostID(request, response);
                viewPage += "boardView";
                break;
            case "/boardUpdate.sil":
                // 글 1건을 수정하는 메서드를 호출한다.
//                service.update(request, response);
                viewPage += "boardReturn";
                break;
            case "/boardDelete.sil":
                // 글 1건을 삭제하는 메서드를 호출한다.
//                service.delete(request, response);
                viewPage += "boardReturn";
                break;
            case "/boardCommentOK.sil":
//                service.selectByPostID(request, response);
                viewPage += "boardView";
                break;
            default:
                viewPage += "index";
                break;
        }
        viewPage += ".jsp";

        // ===========================================================================================================

        // 요청에 따른 페이지를 호출한다. 경로까지 전부 적을 것. "/"는 Webapp 폴더를 의미한다.
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        // 브라우저에 표시할 페이지를 호출한다.
        dispatcher.forward(request, response);
    }
}
