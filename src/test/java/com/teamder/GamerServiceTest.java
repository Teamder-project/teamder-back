package com.teamder;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.teamder.models.Gamer;
import com.teamder.repositories.GamerRepository;
import com.teamder.services.GamerService;

//@DataJpaTest 
//@WebMvcTest
@SpringBootTest(classes=com.teamder.services.GamerService.class)
@ContextConfiguration(classes=com.teamder.services.GamerService.class)
@ExtendWith(SpringExtension.class)
public class GamerServiceTest {

	@Autowired
	GamerService service;
	
	@Test
	@DisplayName("Verification des informations d'un utilisateur et de son existence")
	public void test_recuperation_utilisateur() {
		LocalDate date = LocalDate.parse("1998-01-01");
		long id = 4;
		Gamer gamer = new Gamer(id, "Mig", "mig", "mig@mig.com", date, "M", "France", "ahri");
		Gamer result = this.service.getById(id);
		assertEquals(gamer, result);
	}
	
	@Test
	@DisplayName("Verification du nombre d'info dans la bdd")
	public void test_nombre_info_dans_bdd() {
		List<Gamer> result = this.service.getAll();
		assertEquals(14, result.size());
	}
}
