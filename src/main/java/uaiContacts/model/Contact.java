package uaiContacts.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Contact {

    @Id
    @GeneratedValue
    private int id;
    
	private String name;
	private String phoneNumber;
	private String email;
	
	@ManyToOne
	private Department department;
	
	public Contact(){
	}
	
	public Contact(String name, String phoneNumber, String email, int id, Department department) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.department = department;
	}

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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
    public boolean equals(Object object) {
        if (object instanceof Contact){
            Contact contact = (Contact) object;
            return contact.id == id;
        }
        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
