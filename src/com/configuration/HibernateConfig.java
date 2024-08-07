package com.configuration;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.entity.Book;


public class HibernateConfig {
	
	private static SessionFactory sf;
	
	public static SessionFactory getSessionFactory(){
		
		Configuration con = new Configuration();
		Properties setting  = new Properties();
		
		setting.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
		setting.put(Environment.URL, "jdbc:mysql://localhost:3306/BookSystemHibernate");
		setting.put(Environment.USER, "root");
		setting.put(Environment.PASS, "");
		setting.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
		setting.put(Environment.HBM2DDL_AUTO, "update");
		setting.put(Environment.SHOW_SQL, "true");
		
		con.setProperties(setting);
		con.addAnnotatedClass(Book.class);
		
		ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
		sf = con.buildSessionFactory(sr);
		return sf;
		
	}
	
}
