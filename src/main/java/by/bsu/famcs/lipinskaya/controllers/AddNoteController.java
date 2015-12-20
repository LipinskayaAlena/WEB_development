package by.bsu.famcs.lipinskaya.controllers;

import by.bsu.famcs.lipinskaya.model.Note;
import by.bsu.famcs.lipinskaya.model.Person;
import by.bsu.famcs.lipinskaya.services.NoteService;
import by.bsu.famcs.lipinskaya.services.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by User on 20.12.2015.
 */

@Controller
public class AddNoteController {

    @Autowired
    private NoteService noteService;

    @Autowired
    private PersonService personService;


    @RequestMapping(value = "/add_note/{date}", method = RequestMethod.GET)
    public ModelAndView addNoteView(@PathVariable String date){
        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/addNote");
        modelAndView.addObject("date", date);
        return modelAndView;
    }

    @RequestMapping(value = "/create_note", method = RequestMethod.POST)
    public String createNote(@ModelAttribute("note") Note note, HttpServletRequest request){
        Person user = (Person)request.getSession().getAttribute("user");
        Note newNote = getNoteForCreate(note, user);
        newNote = noteService.createNewNote(newNote);
        String date = newNote.getNote_date().toString();
        return "redirect:/" + user.getUsername() + "/notes/" + date;
    }

    private Note getNoteForCreate(Note note, Person person){
        Note newNote = new Note();
        newNote.setNote_text(note.getNote_text());
        newNote.setNote_date(note.getNote_date());
        newNote.setPerson(person);
        return newNote;
    }
}
