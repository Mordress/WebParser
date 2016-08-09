package com.gmail.mordress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

@WebServlet("/Controller")
public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Map<String, String> links;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        performTask(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        performTask(request, response);
    }

    private void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        response.setContentType("text/html; charset=UTF-8");
        if (request.getParameter("reset") == null) {
            Parser parser = Parser.getInstance();
            try {
                links = parser.parse(request.getParameter("urlForParse"));
                request.setAttribute("parsedLinks", links);

            } catch (IOException e) {
                System.err.println("Can not parse URL: " + request.getParameter("urlForParse"));
                links = new TreeMap<String, String>();
                request.setAttribute("invalidUrl", new Boolean(true));
            }
            /* Искусственная задержка для тестирования waiting box */
            /*
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }*/
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (IOException e) {
            System.err.println("Can not forward request and response");
        }
    }
}
