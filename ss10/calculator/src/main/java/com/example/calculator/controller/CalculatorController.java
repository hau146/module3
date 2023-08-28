package com.example.calculator.controller;

import com.example.calculator.service.CalculatorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Calculator", value = "/calculator")
public class CalculatorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter printWriter = response.getWriter();
        try {
            float result = CalculatorService.calculator(firstOperand, secondOperand, operator);
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/calculator.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            printWriter.println("Error: " + e.getMessage());
        }
    }
}