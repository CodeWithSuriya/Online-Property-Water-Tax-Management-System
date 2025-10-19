package Bean;

/**
 * RegisterUser is a simple JavaBean class that holds user registration details.
 * It contains the username and password fields with their getters and setters.
 * 
 * @author 91979
 */
public class RegisterUser {

    // Fields
    private String username;
    private String password;

    // Default constructor
    public RegisterUser() {
    }

    // Parameterized constructor (optional, useful for initialization)
    public RegisterUser(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Getter and Setter for username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and Setter for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
