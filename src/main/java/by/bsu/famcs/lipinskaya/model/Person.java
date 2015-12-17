package by.bsu.famcs.lipinskaya.model;

/**
 * Created by User on 16.12.2015.
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "user")
public class Person implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "login", nullable = false)
    private String login;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "e_mail", nullable = false)
    private String e_mail;

    @Column(name = "password", nullable = false)
    private String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return login;
    }

    public void setUsername(String userName) {
        this.login = userName;
    }

    public String getEmail() {
        return e_mail;
    }

    public void setEmail(String email) {
        this.e_mail = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
