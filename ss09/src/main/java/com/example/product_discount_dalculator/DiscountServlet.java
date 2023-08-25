package com.example.product_discount_dalculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount-servlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double ListPrice = Double.parseDouble(request.getParameter("ListPrice"));
        Double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        Double discountAmount = ListPrice * discountPercent * 0.01;
        Double discountPrice = discountPercent - discountAmount;
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);
        request.setAttribute("ListPrice",ListPrice);
        request.setAttribute("DiscountPercent",discountPercent);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(request,response);
    }
}