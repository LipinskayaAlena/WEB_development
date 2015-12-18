package by.bsu.famcs.lipinskaya.services;

import by.bsu.famcs.lipinskaya.dao.PersonDAO;
import by.bsu.famcs.lipinskaya.model.Person;
import by.bsu.famcs.lipinskaya.utils.handlers.CustomPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("personService")
@Transactional
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonDAO personDAO;

    @Autowired
    private CustomPasswordEncoder customPasswordEncoder;

    public void update(Person person) {
        personDAO.updatePerson(person);
    }

    public Person registerNewUserAccount(Person newPerson) throws NullPointerException {
        if (usernameExist(newPerson.getUsername())) {
            throw new NullPointerException("User with this username is already exist. Username: " + newPerson.getUsername());
        }
        Person person = new Person();

        person.setName(newPerson.getName());
        person.setEmail(newPerson.getEmail());
        person.setPassword(customPasswordEncoder.encodePassword(newPerson.getPassword(), newPerson.getUsername()));
        person.setUsername(newPerson.getUsername());
        person = personDAO.createPerson(person);

        return person;
    }

    private boolean usernameExist(final String name) {
        final Person user = personDAO.getPersonByUsername(name);
        return user != null;
    }

    public Person readByUserName(String userName) {
        return personDAO.getPersonByUsername(userName);
    }
}
