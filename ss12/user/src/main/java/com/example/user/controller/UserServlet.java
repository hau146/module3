package com.example.user.controller;

import com.example.user.model.User;
import com.example.user.service.IUserService;
import com.example.user.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showFormCreate":
                showFormCreate(request, response);
                break;
            case "showFormUpdate":
                showFormUpdate(request, response);
                break;
            case "showFormSearch":
                showFormSearch(request, response);
                break;
            case "showFormSortUp":
                showFormSortUp(request, response);
                break;
            case "showFormSortDown":
                showFormSortDown(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showFormSortDown(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.sortDown();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showFormSortUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.sortUp();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request, response);
    }

    private static void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.finById(id);
        RequestDispatcher requestDispatcher;
        request.setAttribute("user",user);
        requestDispatcher = request.getRequestDispatcher("update.jsp");
        requestDispatcher.forward(request, response);
    }

    private static void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.showList();
        request.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "search":
                searchByCountry(request, response);
                

        }
    }

    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = userService.searchByCountry(country);
        request.setAttribute("userList",userList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id_delete"));
        userService.delete(id);
        try {
            response.sendRedirect("user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userService.update(id, new User(name, email, country));
        try {
            response.sendRedirect("user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userService.save(new User(name, email, country));
        try {
            response.sendRedirect("user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}