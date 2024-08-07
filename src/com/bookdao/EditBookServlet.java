package com.bookdao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.configuration.HibernateConfig;
import com.entity.Book;

public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditBookServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");

        Session session = HibernateConfig.getSessionFactory().openSession();
        Transaction transaction = null;
        boolean result = false;

        try {
            transaction = session.beginTransaction();
            Book book = session.get(Book.class, id);

            if (book != null) {
                book.setB_title(title);
                book.setB_author(author);
                book.setB_price(price);
                session.update(book);
                transaction.commit();
                result = true;
            } else {
                result = false;
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            result = false;
        } finally {
            session.close();
        }

        if (result) {
            response.sendRedirect("booklist.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
