package com.bookdao;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.configuration.HibernateConfig;
import com.entity.Book;

public class BookDao {
	
	public static boolean save(Book book){
	
		Session session = HibernateConfig.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		int i = (Integer) session.save(book);
		trans.commit();
		session.close();
		if(i > 0){
			return true;
		}
		else{
			return false;
		}
	
	}

	public static boolean deleteBook(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateConfig.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		Book b = session.get(Book.class,id);
		session.delete(b);
		trans.commit();
		session.close();
		return true;
		
	}

	

}
