package by.bsu.famcs.lipinskaya.services;

import by.bsu.famcs.lipinskaya.dao.NoteDAO;
import by.bsu.famcs.lipinskaya.model.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("noteService")
@Transactional
public class NoteServiceImpl implements NoteService {

    @Autowired
    private NoteDAO noteDAO;

    public Note getNoteById(long note_id) {
        return noteDAO.getNoteById(note_id);
    }

    public void update(Note noteToUpdate) {
        noteDAO.update(noteToUpdate);
    }

    public List<Note> getNotesByUsername(String username) {
        return noteDAO.getNotesByUsername(username);
    }

}
