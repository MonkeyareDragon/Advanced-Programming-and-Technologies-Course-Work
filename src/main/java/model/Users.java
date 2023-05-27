package model;
public class Users{
	String userDetailsId;
	String firstName;
	String lastName;
	String gender;
	String description;
	String userPhoto;
	String email;
	public Users(String userDetailsId, String firstName, String lastName, String gender, String description,
			String userPhoto, String email ) {
			this.userDetailsId = userDetailsId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.description = description;
		this.userPhoto = userPhoto;
		this.email = email;
	}
	public String getUserDetailsId() {
		return userDetailsId;
	}
	public void setUserDetailsId(String userDetailsId) {
		this.userDetailsId = userDetailsId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
 