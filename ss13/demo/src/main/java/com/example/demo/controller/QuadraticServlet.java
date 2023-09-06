package com.example.demo.controller;

import com.example.demo.service.QuadraticService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuadraticServlet", value = "/quadratic")
public class QuadraticServlet extends HttpServlet {
    private QuadraticService quadraticService = new QuadraticService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        double numA  = Double.parseDouble(request.getParameter("numA"));
        double numB = Double.parseDouble(request.getParameter("numB"));
        double numC = Double.parseDouble(request.getParameter("numC"));
        List<Double> doubleList = quadraticService.quadratic(numA,numB,numC);
        if (doubleList.size()==0) {
            request.setAttribute("result", "Phương trình vô nghiệm");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if(doubleList.size() == 1) {
            request.setAttribute("result","Phương trình có 1 nghiệm x1 = " + doubleList.get(0));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else if(doubleList.size() == 2){
            request.setAttribute("result", "Phương trình có 2 nghiệm x1 = " + doubleList.get(0)
                    + " và x2 = " + doubleList.get(1) );
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}