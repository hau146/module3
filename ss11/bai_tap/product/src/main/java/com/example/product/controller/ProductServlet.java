package com.example.product.controller;

import com.example.product.model.Product;
import com.example.product.service.IProductService;
import com.example.product.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "showFormCreate":
                showFormCreate(request, response);
                break;
            case "showFormEdit":
                showFormEdit(request, response);
                break;
            case "showFormDelete":
                showFormDelete(request, response);
                break;
            case "showFormSearch":
                showFormSearch(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.finById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("delete.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // Phương thức trả về trang edit.jsp để hiển thị product để sửa.
    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.finById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("edit.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    // Phương thức trả về trang create.jsp để tạo product.
    private static void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // Phương thức trả về trang list.jsp để hiển thị toàn bộ product.
    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.showList();
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchNameProduct(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        try {
            response.sendRedirect("product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //tìm
    private void searchNameProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> list = productService.findByName(name);
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    //sửa
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        productService.update(id,new Product(name,price,describe,producer));
        try {
            response.sendRedirect("product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    //thêm
    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        productService.save(new Product(name,price,describe,producer));
        try {
            response.sendRedirect("product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}