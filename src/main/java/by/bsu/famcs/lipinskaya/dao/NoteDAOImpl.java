package by.bsu.famcs.lipinskaya.dao;

import by.bsu.famcs.lipinskaya.model.Note;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.LinkedList;
import java.util.List;

@Repository
public class NoteDAOImpl implements NoteDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public Note getNoteById(long note_id) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
        criteria.add(Restrictions.idEq(note_id));
        List notes = criteria.list();
        if(notes.size() > 0) return (Note) notes.get(0);
        return null;
    }

    public List<Note> getNotesByUsername(String username) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
        criteria.add(Restrictions.eq("person.username", username));
        List notes = criteria.list();
        List<Note> result = new LinkedList<Note>();
        for (Object note : notes) {
            result.add((Note) note);
        }
        return result;
    }


    public void update(Note spot) {
        sessionFactory.getCurrentSession().update(spot);
        sessionFactory.getCurrentSession().flush();
    }
}
