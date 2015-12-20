package by.bsu.famcs.lipinskaya.controllers;

import by.bsu.famcs.lipinskaya.model.Note;
import by.bsu.famcs.lipinskaya.model.Person;
import by.bsu.famcs.lipinskaya.services.NoteService;
import by.bsu.famcs.lipinskaya.services.PersonService;
import com.mysql.fabric.xmlrpc.base.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 18.12.2015.
 */
@Controller
public class NotesController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = "/all_notes", method = RequestMethod.GET)
    public ModelAndView allNotes(HttpServletRequest request){
        Person user = (Person)request.getSession().getAttribute("user");
        List<Note> notes = noteService.getNotesByUsername(user.getUsername());
        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/AllNotes");
        modelAndView.addObject("all_notes", notes);
        return modelAndView;
    }

    @RequestMapping(value = "/{username}/notes/{date}", method = RequestMethod.GET)
    public ModelAndView getNotesByDate(@PathVariable String username, @PathVariable String date) {
        List<Note> notes = noteService.getNotesByUsername(username);

        List<Note> notesThisDay = new ArrayList<Note>();
        for(Note note: notes){
            if(note.getNote_date().toString().equals(date))
                notesThisDay.add(note);
        }

        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/Notes");
        modelAndView.addObject("notes", notesThisDay);
        modelAndView.addObject("date", date);
        return modelAndView;
    }

    @RequestMapping(value = "/note/{note_id}/edit", method = RequestMethod.POST)
    public String editNote(@ModelAttribute("note") Note note, HttpServletRequest request) {
        Note noteToUpdate = noteService.getNoteById(Long.parseLong(request.getParameter("note_id")));
        noteToUpdate.setNote_text(note.getNote_text() != null ? note.getNote_text(): "null");
        noteToUpdate.setNote_date(note.getNote_date());
        noteService.update(noteToUpdate);

        return "redirect:/all_notes";
    }


    @RequestMapping(value = "/note/{note_id}/show", method = RequestMethod.GET)
    public ModelAndView showNote(@PathVariable String note_id) {
        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/editNote");
        modelAndView.addObject("note", noteService.getNoteById(Long.parseLong(note_id)));
        return modelAndView;
    }

    @RequestMapping(value = "/note/{username}/{note_id}/{date}/delete", method = RequestMethod.GET)
    public String deleteNote(@PathVariable String note_id,@PathVariable String username, @PathVariable String date) {
        noteService.deleteNoteById(Long.parseLong(note_id));
        return "redirect:/" + username + "/notes" + "/" + date;
    }
}
