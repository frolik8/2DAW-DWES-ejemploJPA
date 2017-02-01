package ejemplojpa;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the generos database table.
 * 
 */
@Entity
@Table(name="generos")
@NamedQuery(name="Genero.findAll", query="SELECT g FROM Genero g")
public class Genero implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String genero;

	public Genero() {
	}

	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

}