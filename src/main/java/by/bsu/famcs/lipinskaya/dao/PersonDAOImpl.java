package by.bsu.famcs.lipinskaya.dao;

import by.bsu.famcs.lipinskaya.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PersonDAOImpl implements PersonDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public Person createPerson(Person person) {
        getCurrentSession().save(person);
        getCurrentSession().flush();
        return person;
    }

    public void updatePerson(Person person) {
        getCurrentSession().update(person);
    }

    public Person getPersonByUsername(String username) {
        return (Person) getCurrentSession().get(Person.class, username);
    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
}
