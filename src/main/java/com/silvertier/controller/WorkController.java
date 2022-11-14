package com.silvertier.controller;

import com.silvertier.service.WorkService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "WorkController", value = "*.sil")
public class WorkController extends HttpServlet {
    private WorkService service = WorkService.getInstance();

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet()");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = request.getRequestURI();
        String contextPath = request.getContextPath();
        String context = url.substring(contextPath.length());

        String viewPage = "/WEB-INF/";
        switch (context) {
            case "/work.sil":
                viewPage += "work";
                service.selectList(request, response);
                service.selectEmergency(request, response);
                break;
            case "/workInsert.sil":
                viewPage += "workInsert";
                break;
            case "/workInsertOK.sil":
                service.insert(request, response);
                viewPage += "index";
                break;
            case "/workUpdate.sil":
                viewPage += "workUpdate";
                break;
            case "/workDelete.sil":
                viewPage += "workDelete";
                break;
            case "/workList.sil":
                viewPage += "workList";
                break;
            case "/workView.sil":
                viewPage += "workView";
                break;
            case "/test.sil":
                viewPage += "test";
                break;
        }
        viewPage += ".jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
