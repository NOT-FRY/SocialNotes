package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


import it.unisa.model.ChatBean;
import it.unisa.model.ChatModelDS;
import it.unisa.model.ParticipationBean;
import it.unisa.model.ParticipationModelDS;

/**
 * Servlet implementation class ChatCreateServlet
 */
@WebServlet("/ChatCreateServlet")
public class ChatCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		String loginURL = "login.jsp";
		 String adminURL = "admin.jsp";
		 String chat = "chat.jsp";
		
		if (session==null) {
			loginURL = response.encodeURL(loginURL);
			response.sendRedirect(loginURL);
			return;
		}if (session!=null) {
			if ((session.getAttribute("username"))!=null) {
				if (((int)session.getAttribute("role"))==1) {
					  adminURL = response.encodeURL(adminURL);
					  response.sendRedirect(adminURL);
					  return;
				}
					
			}
		}
		
		String titoloChat = request.getParameter("titolo");
		String[] users = request.getParameterValues("amici");
		
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		ChatModelDS chatModel = new ChatModelDS(ds);
		ParticipationModelDS pModel = new ParticipationModelDS(ds);
		
			ChatBean chatBean = new ChatBean();
		
		Collection<ParticipationBean> participation=new LinkedList<ParticipationBean>();
		Iterator<?> it= participation.iterator();
		
		
		for(String e: users) {
			ParticipationBean pBean = new ParticipationBean();
			pBean.setUsername(e);
			
		}
		
		chatBean.setTitolo(titoloChat);
		try {
			chatModel.doSave(chatBean);
			ChatBean ChatBeanNew = new ChatBean();
			ChatBeanNew = chatModel.doRetrieveLast();
			int chatID = ChatBeanNew.getChatID();
			
			ParticipationBean pBean = new ParticipationBean();
			pBean.setUsername((String)session.getAttribute("username"));
			pBean.setChatID(chatID);
			
			try { 
				pModel.doSave(pBean);
			} catch (SQLException h) {
				h.printStackTrace();
			}
			
			for(String e: users) {
				ParticipationBean pBeanNew = new ParticipationBean();
				pBeanNew.setUsername(e);
				pBeanNew.setChatID(chatID);
				
				try { 
					pModel.doSave(pBeanNew);
				} catch (SQLException h) {
					h.printStackTrace();
				}
				
		       // participation.add(pBean);
			}
			
			while (it.hasNext()) {
				ParticipationBean participationBean = (ParticipationBean)it.next();
				pModel.doSave(participationBean);
			} 
			
			
			chat = response.encodeURL(chat);
			response.sendRedirect(chat);
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	


}
