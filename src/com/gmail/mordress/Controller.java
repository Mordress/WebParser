package com.gmail.mordress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/Controller")
public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Map<String, String> links;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performTask(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performTask(request, response);
    }

    private void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        if (request.getParameter("reset") == null) {
            Parser parser = Parser.getInstance();
            links = parser.parse(request.getParameter("urlForParse"));

            for (Map.Entry<String, String> pairs : links.entrySet()) {
                System.out.println(pairs.getKey() + "\n\t" + pairs.getValue());
            }

            String s = this.getServletContext().getContextPath();
            request.setAttribute("parsedLinks", links);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);

    }
}
