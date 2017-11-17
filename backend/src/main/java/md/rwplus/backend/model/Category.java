package md.rwplus.backend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity    //deorece va transmite un obiect in baza de date
@Table(name = "category")
public class Category {
	//private fields 
		@Id   //fiecare entitate trebuie sa aiba un ID , ca cheie primara
		@GeneratedValue(strategy = GenerationType.IDENTITY) // pn a se incrementa ID-ul automat
		//@Column(name = "id", unique = true)
		private int id;
		
		private String name;
		
		private String description;
		
		@Column(name = "image_url") //numele acestea trebuie sa corespunda cu numele din tabela
		private String imageURL;
		
		@Column (name = "is_active")  //numele acestea trebuie sa corespunda cu numele din tabela
		private boolean active = true;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", description=" + description + ", imageURL=" + imageURL
				+ ", active=" + active + "]";
	}


	
}
