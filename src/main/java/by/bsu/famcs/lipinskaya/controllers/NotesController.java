package by.bsu.famcs.lipinskaya.controllers;

import by.bsu.famcs.lipinskaya.model.Note;
import by.bsu.famcs.lipinskaya.services.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 18.12.2015.
 */
@Controller
public class NotesController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = "/{username}/notes", method = RequestMethod.GET)
    public ModelAndView getAllNotes(@PathVariable String username) {
        List<Note> notes = noteService.getNotesByUsername(username);
        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/Notes");
        modelAndView.addObject("notes", notes);
        return modelAndView;
    }

    @RequestMapping(value = "/{username}/notes/{date}", method = RequestMethod.GET)
    public ModelAndView getNoteByDate(@PathVariable String username, @PathVariable String date) {
        List<Note> notes = noteService.getNotesByUsername(username);

        List<Note> notesThisDay = new ArrayList<Note>();
        for(Note note: notes){
            if(note.getNote_date().toString().equals(date))
                notesThisDay.add(note);
        }

        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/Notes");
        modelAndView.addObject("notes", notesThisDay);
        return modelAndView;
    }

}
