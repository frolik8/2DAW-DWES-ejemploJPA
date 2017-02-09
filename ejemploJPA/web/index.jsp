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
	
	Genero genero = null; 
	
	try {
	
		tx.begin();
		if (tx.isActive())
			out.println("Transacción activa.<br>");
		else
			out.println("Transacción no activa.<br>");
			
		// Se hace una búsqueda
		genero = em.find(Genero.class, "Accion");
		if (genero != null)
			out.println("Género encontrado: "+genero.getGenero()+"<br>");
		else
			out.println("No se ha encontrado <br>");
			
		// Se hace persistente una entidad
		genero = new Genero();
		genero.setGenero("insufrible");
		out.println("Persistencia de: "+genero.getGenero()+"<br>");
		
		em.persist(genero);
		
		tx.commit();
	} catch (EntityExistsException e) {
		out.println("Excepción de existencia previa de la entidad.<br>");
		if (tx.isActive())
			tx.rollback();
	} catch (IllegalArgumentException e) {
		out.println("Excepción de instancia no es tipo entidad.<br>");
		if (tx.isActive())
			tx.rollback();
	} catch (TransactionRequiredException e) {
		out.println("Problema con configuración de transacción.<br>");
		if (tx.isActive())
			tx.rollback();
	} catch (RollbackException e) {
		out.println("El commit ha fallado.<br>");
		if (tx.isActive())
			tx.rollback();
	} catch (Exception e) {
		out.println("Error desconocido en transacción con objeto Genero: "+genero.getGenero()+"<br>");
		e.printStackTrace();
		if (tx.isActive())
			tx.rollback();
	}
	finally {
		em.close();
		emf.close();
	}
%>
</body>
</html>