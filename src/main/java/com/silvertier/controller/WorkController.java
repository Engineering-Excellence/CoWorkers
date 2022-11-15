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
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        String url = request.getRequestURI();
//        String contextPath = request.getContextPath();
//        String context = url.substring(contextPath.length());
//
//        String viewPage = "/WEB-INF/";
//        switch (context) {
//            case "/work.sil":
//                viewPage += "work";
//                service.selectList(request, response);
//                service.selectEmergency(request, response);
//                break;
//            case "/workInsert.sil":
//                viewPage += "workInsert";
//                break;
//            case "/workInsertOK.sil":
//                service.insert(request, response);
//                viewPage += "work";
//                break;
//            case "/workUpdate.sil":
//                viewPage += "workUpdate";
//                break;
//            case "/workDelete.sil":
//                viewPage += "workDelete";
//                break;
//            case "/workView.sil":
//                viewPage += "workView";
//                break;
//        }
//        viewPage += ".jsp";
//        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//        dispatcher.forward(request, response);
        process(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("process");
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
                service.selectPriority(request, response);
                System.out.println("work");
                break;
            case "/workInsert.sil":
                viewPage += "workInsert";
                System.out.println("workInsert");
                break;
            case "/workInsertOK.sil":
                service.insert(request, response);
                viewPage += "goWork";
                System.out.println("workInsertOK");
                break;
            case "/workUpdate.sil":
                service.selectByWorkID(request, response);
                viewPage += "workUpdate";
                System.out.println("workUpdate");
                break;
            case "/workUpdateOK.sil":
                viewPage += "goWork";
                service.update(request, response);
                System.out.println("workUpdateOK");
                break;
            case "/workDelete.sil":
                viewPage += "goWork";
                service.delete(request, response);
                System.out.println("workDelete");
                break;
            case "/workView.sil":
                viewPage += "workView";
                System.out.println("workView");
                service.selectList(request, response);
                service.selectByWorkID(request, response);
                break;
        }
        viewPage += ".jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }
}