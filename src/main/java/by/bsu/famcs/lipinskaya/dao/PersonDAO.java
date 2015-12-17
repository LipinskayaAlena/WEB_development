package by.bsu.famcs.lipinskaya.dao;

import by.bsu.famcs.lipinskaya.model.Person;

public interface PersonDAO {

    Person createPerson(Person person);

    void updatePerson(Person person);

    Person getPersonByUsername(String username);

}
