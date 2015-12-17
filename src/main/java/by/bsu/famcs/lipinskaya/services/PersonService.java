package by.bsu.famcs.lipinskaya.services;


import by.bsu.famcs.lipinskaya.model.Person;

public interface PersonService {
    void update(Person person);

    Person registerNewUserAccount(Person newPerson) throws NullPointerException;

    Person readByUserName(String userName);
}
