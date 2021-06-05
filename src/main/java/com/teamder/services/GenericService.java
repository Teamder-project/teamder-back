package com.teamder.services;

import java.util.List;

public interface GenericService<T> {

	public List<T> getAll();
	
	public T getById(Long id);
	
	public T save(T entite);
	
	public T update(T entite);
	
	public void deleteById(Long id);
}
