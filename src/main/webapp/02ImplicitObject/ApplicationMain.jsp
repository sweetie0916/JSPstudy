<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - application</title></head>
<body>
    <h2>web.xml에 설정한 내용 읽어오기</h2>
    초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %>

    <h2>서버의 물리적 경로 얻어오기</h2>
    application 내장 객체 : <%= application.getRealPath("/02ImplicitObject") %>

    <h2>선언부에서 application 내장 객체 사용하기</h2>
    <%!
    /*
    선언부에서 내장객체를 바로 사용하는것은 불가능하다.
    내장객체는 _jspService() 메서드내에서 생성된 지역변수이므로
    다른 지역인 선언부에서 사용하라면 매개변수로 전달받아야 한다.
    */
    public String useImplicitObject() {
    	/* 방법1 : getServletContext() 메서드를 통해 선언부에서 
    		application 내장객체를 얻어올 수 있다. */
        return this.getServletContext().getRealPath("/02ImplicitObject");
    }
    public String useImplicitObject(ServletContext app) {
    	/* 방법2 : 스크립트릿에서 메서드를 호출할때 application 내장객체를
    		매개변수로 전달해서 사용한다. */
        return app.getRealPath("/02ImplicitObject");
    }
    %>
    <ul>
        <li>this 사용 : <%= useImplicitObject() %></li>
        <li>내장 객체를 인수로 전달 : <%= useImplicitObject(application) %></li>
    </ul>
</body>
</html>