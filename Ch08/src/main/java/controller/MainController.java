package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommonService;

public class MainController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 프로퍼티파일(액션주소 맵핑 파일) 경로 구하기
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		// 프로퍼티파일 입력스트립 연결 후 프로퍼티 객체 생성
		Properties prop = new Properties();
		
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		// 프로퍼티 객체로부터 서비스 객체(Map 구조체) 생성, iterator 반복자
		Iterator iter = prop.keySet().iterator();
		
			while(iter.hasNext()) {
				String k = iter.next().toString();
				String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);		
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}// init end
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
		
		
		
	}// doGet end
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
		
	}// doPost end
		
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		// 요청주소에서 Service객체 key("/hello.do", "/welcome.do", "/greeting.do")구하기
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// Map에서 Service객체 꺼내기
		CommonService instance = (CommonService) instances.get(key);
		
		// Service객체 실행후 View 리턴 받기
		String view = instance.requestProc(req, resp);
		
		// View 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
		
	}// requestProc end
		
	
}//
