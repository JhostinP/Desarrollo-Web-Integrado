package net.colegio.interfaces;

import java.util.List;

import net.colegio.entity.Docente;

public interface DocenteDAO {
	//método save que registra un Docente y retorna un entero
	int save(Docente bean);
	//método update que actualiza un Docente y retorna un entero
	int update(Docente bean);
	//método deleteById que elimina un Docente según su código  y retorna un entero
	int deleteById(int cod);
	//método findById busca código de un Docente y retorna un objeto Docente
	Docente findById(int cod);
	//método findAll listar todos los docentes
	List<Docente> findAll();
	
}
