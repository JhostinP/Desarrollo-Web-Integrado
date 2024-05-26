package net.clinica.dao;


public interface BienDAO{
	List<Bien> findAllBienByTipo(int codTipo);
}
