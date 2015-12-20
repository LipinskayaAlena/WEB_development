package by.bsu.famcs.lipinskaya.dao;

import by.bsu.famcs.lipinskaya.model.Note;

import java.util.List;

public interface NoteDAO {
    Note getNoteById(long note_id);
    List getNotesByUsername(String username);
    void update(Note spot);
    Note createNewNote(Note newNote);
    void deleteNoteById(long noteId);
}
