package com.crunch.socket;

import com.crunch.domain.MemoDTO;
import com.crunch.service.MemoService;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class AlarmHandler extends TextWebSocketHandler  {

    // 로그인 한 전체
    List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
    // 1대1
    Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

    @Autowired
    MemoService memoService;



    // 접속
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //접속한 전체 유저 아이디
        sessions.add(session);
        log.info("접속한 전체 유저 아이디 : " + session.getId());
        //로그인한 개별 유저 아이디를 가져온다.
        String senderID = getId(session);
        log.info("senderID : " + senderID);
        //userSessionsMap 에 개별 유저 아이디를를 넣는다.
        userSessionsMap.put(senderID, session);
        log.info("userSessionsMap : " + userSessionsMap);
    }

    // 소켓에 메세지
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String loginId=getId(session);
        log.info("loginId : " + loginId);
        Map<String, Object> httpSession = session.getAttributes();
//        log.info("session : " + session);
//        log.info("httpSession : " + httpSession);
        int userID = (int) httpSession.get("userID");
        log.info("userID : " + userID);
        if(loginId!=null) {

            MemoDTO selectLsatInform =  memoService.selectLastInform(userID);
            log.info("selectLsatInform : " + selectLsatInform);

            WebSocketSession webSocketSession = userSessionsMap.get(loginId);
//            log.info("webSocketSession : " + webSocketSession);

            Gson gson = new Gson();
            // 알림 데이터 JSON 으로 전환 후 TextMessage 변환
            TextMessage textMessage = new TextMessage(gson.toJson(selectLsatInform));
            webSocketSession.sendMessage(textMessage);
            log.info("textMessage : " + (textMessage));

        }
        else {
            log.info("로그인이 되어있지 않습니다.");
        }
    }

    // 연결 해제
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info("afterConnectionClosed : " + session+", status : "+status);
        //소켓 연결이 끊겼을 때 개별 접속아이디 해체 저리한다.
        userSessionsMap.remove(session.getId());
        //소켓 연결이 끊겼을 때 전체 접속자 아이디 해체 저리한다.
        sessions.remove(session);
    }


    // 웹소켓 id 가져오기
    private String getId(WebSocketSession session) {
/*
        (int)request.getSession().getAttribute("userID");
        또는 ,
        session.getAttribute("userID");
        이렇게 세션값을 가져오나 여기 웹소켓에서는 세션값을 WebSocketSession session  형태로 가져옵니다.
        따라서 , 다음과 코드 형태로 세션값을 가져옵니다.
*/


        String loginId = session.getId();
        log.info("loginId : " + loginId);
        if (loginId == null) {
            //System.out.println("로그인 loginID 가 널일경우  :" + session.getId());
            //랜덤 아이디 생성, 사이트 접속한 사람 전체
            //ex ) vawpuj5h, 5qw40sff
            return session.getId();
        } else {
            //로그인한 유저 반환
            return loginId;
        }
    }



}