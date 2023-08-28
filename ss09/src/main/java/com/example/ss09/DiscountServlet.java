package com.example.ss09;

import com.example.ss09.service.DiscountService;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        Double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        Double discountAmount = DiscountService.getDouble(listPrice, discountPercent);
        Double discountPrice = DiscountService.getDiscountPrice(discountPercent, discountAmount);
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        request.setAttribute("listPrice",listPrice);
        request.setAttribute("DiscountPercent",discountPercent);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(request,response);
    }
}