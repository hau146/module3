package com.example.demo.controller;

import com.example.demo.model.Customer;
import com.example.demo.service.CustomerService;
import com.example.demo.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //lấy parameters (dữ liệu request gửi đi) có name là action\
        String action = request.getParameter("action");

        //nếu dl request gửi đi không có action sẽ trả về null
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
        }
    }

    // Phương thức xóa customer dựa theo id.
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.finById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null) {
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.customerService.remove(id);
            try {
                response.sendRedirect("/customers");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Phương thức sửa customer.
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = this.customerService.finById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null) {
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            this.customerService.update(id, customer);
            request.setAttribute("customer", customer);
            request.setAttribute("tin nhắn", "Thông tin khách hàng đã được cập nhật");
            requestDispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    // Phương thức thêm customer.
    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) (Math.random() * 10000);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(id, name, email, address);
        this.customerService.save(customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
        request.setAttribute("tin nhắn", "Khách hàng mới đã được tạo");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewCustomer(request, response);
                break;
            default:
                ListCustomers(request, response);
        }
    }

    // Phương thức trả về trang list.jsp để hiển thị toàn bộ customer.
    private void ListCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = this.customerService.finAll();
        request.setAttribute("customers",customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    // Phương thức trả về trang delete.jsp để hiển thị customer để xóa.
    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.finById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer",customer);
            requestDispatcher = request.getRequestDispatcher("customer/delete.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e){
            e.printStackTrace();
        }
    }

    // Phương thức trả về trang edit.jsp để hiển thị customer để sửa.
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.finById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer",customer);
            requestDispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e){
            e.printStackTrace();
        }
    }

    // Phương thức trả về trang view.jsp hiển thị thông tin của customer.
    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.finById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer",customer);
            requestDispatcher = request.getRequestDispatcher("customer/view.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    // Phương thức trả về trang create.jsp để tạo customer.
    private static void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}