package by.bsu.famcs.lipinskaya.services;

import by.bsu.famcs.lipinskaya.model.Note;

import java.util.List;

public interface NoteService {

    Note getNoteById(long note_id);

    List<Note> getNotesByUsername(String username);
}
