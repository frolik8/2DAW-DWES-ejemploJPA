<%@page import="javax.persistence.*"%>
<%@page import="ejemplojpa.Genero"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Probando JPA</title>
</head>
<body>
Holaaaaa
<br>
Persistencia<br>
<%
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("ejemploJPA");
	EntityManager em = emf.createEntityManager();
	EntityTransaction tx = em.getTransaction();
	
	Genero genero = new Genero();
	genero.setGenero("insufrible");
	
	tx.begin();
	try {
		em.persist(genero);
		tx.commit();
	} catch (Exception e) {
		System.out.println("Error en transacción con objeto Genero.");
		tx.rollback();
	}
	finally {
		em.close();
		emf.close();
	}
%>
</body>
</html>