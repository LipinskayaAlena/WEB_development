package by.bsu.famcs.lipinskaya.services;

import by.bsu.famcs.lipinskaya.model.Note;

import java.util.List;

public interface NoteService {

    Note getNoteById(long note_id);
    void update(Note noteToUpdate);
    List<Note> getNotesByUsername(String username);
    void deleteNoteById(long noteId);
    Note createNewNote(Note newNote);
}
