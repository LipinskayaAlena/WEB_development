package by.bsu.famcs.lipinskaya.controllers;

import by.bsu.famcs.lipinskaya.model.Note;
import by.bsu.famcs.lipinskaya.model.Person;
import by.bsu.famcs.lipinskaya.services.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by User on 18.12.2015.
 */
@Controller
public class MonthController {

    private static int currentMonth;
    private static int currentYear;
    private Date date;

    @Autowired
    NoteService noteService;


    @RequestMapping(value = "/month", method = RequestMethod.GET)
    public ModelAndView getMonth(HttpServletRequest request) {
        Person user = (Person)request.getSession().getAttribute("user");
        List<Note> notes = noteService.getNotesByUsername(user.getUsername());
        List<String> dateNotes = new ArrayList<String>();
        List<Note> noteToday = new ArrayList<Note>();

        Date curDate = new Date();
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(curDate);
        for(Note note: notes) {
            if(note.getNote_date().equals(currentDate))
                noteToday.add(note);
            dateNotes.add(note.getNote_date().toString());
        }


        date = new Date();

        currentMonth = date.getMonth() + 1;
        currentYear = date.getYear() + 1900;


        double numberDay = numberDayInMonth(currentMonth, currentYear);
        int dayOfWeekFirstDayMonth = dayOfWeek(1, currentMonth, currentYear) - 1;
        String nameCurrentMonth = getNameMonth(date.getMonth());

        int numberLastMonth = currentMonth - 1;
        int yearLastMonth = currentYear;
        if(numberLastMonth == 0) {
            numberLastMonth = 12;
            yearLastMonth--;
        }

        double numberDayLastMonth = (int) numberDayInMonth(numberLastMonth, yearLastMonth);


        List<Integer> listDays = new ArrayList<Integer>();
        List<Integer> listDaysLastMonth = new ArrayList<Integer>();
        for(int j = (int)(numberDayLastMonth - dayOfWeekFirstDayMonth) + 1; j <= numberDayLastMonth; j++)
            listDaysLastMonth.add(j);

        for(int i = 1; i <= numberDay; i++)
            listDays.add(i);

        ModelAndView modelAndView = null;
        switch (curDate.getMonth()) {
            case 10:
                modelAndView = new ModelAndView("../../WEB-INF/pages/november");
                break;
            case 11:
                modelAndView = new ModelAndView("../../WEB-INF/pages/december");
                break;
            case 0:
                modelAndView = new ModelAndView("../../WEB-INF/pages/january");
                break;
            case 1:
                modelAndView = new ModelAndView("../../WEB-INF/pages/febrary");
                break;
        }



        modelAndView.addObject("current_day", currentDate);
        modelAndView.addObject("last_month", listDaysLastMonth);
        modelAndView.addObject("days", listDays);
        modelAndView.addObject("name_month_year", nameCurrentMonth + " " + currentYear);
        modelAndView.addObject("date_notes", dateNotes);
        modelAndView.addObject("note_today", noteToday);

        return modelAndView;
    }

    @RequestMapping(value = "/month/last", method = RequestMethod.GET)
    public ModelAndView getLasttMonth(HttpServletRequest request) {
        //int currentYear = date.getYear();
        //int numberLastMonth = date.getMonth() - 1;
        currentMonth--;

        if(currentMonth == 0){
            currentYear--;
            currentMonth = 12;
        }

        double numberDay = numberDayInMonth(currentMonth, currentYear);
        int numberDayOfWeek = dayOfWeek(1, currentMonth, currentYear);
        String nameCurrentMonth = getNameMonth(currentMonth);

        int numberLastMonth = currentMonth--;
        int yearLastMonth = currentYear;
        if(numberLastMonth == 0) {
            numberLastMonth = 12;
            yearLastMonth--;
        }
        double numberDayLastMonth = numberDayInMonth(numberLastMonth, yearLastMonth);


        List<Integer> listDays = new ArrayList<Integer>();
        List<Integer> listDaysLastMonth = new ArrayList<Integer>();
        for(int j = (int)numberDayLastMonth - numberDayOfWeek; j < numberDayLastMonth; j++)
            listDaysLastMonth.add(j);

        for(int i = 0; i < numberDay; i++)
            listDays.add(i);

        ModelAndView modelAndView;

        modelAndView = new ModelAndView("../../WEB-INF/pages/december");
        modelAndView.addObject("current_day", "null");
        modelAndView.addObject("last_month", listDaysLastMonth);
        modelAndView.addObject("current_month", listDays);
        modelAndView.addObject("name_month_year", nameCurrentMonth + " " + currentYear);

        return modelAndView;
    }

    public int dayOfWeek(int day, int month, int year) {
        int a = (14 - month) / 12, y = year - a, m = month + 12 * a - 2;
        return (7000 + (day + y + y / 4 - y / 100 + y / 400 + (31 * m) / 12)) % 7;
    }

    public double numberDayInMonth(int x, int y){
        return 28 + ((x + Math.floor(x / 8)) % 2) + 2 % x +
                Math.floor((1 + (1 - (y % 4 + 2) % (y % 4 + 1)) *
                ((y % 100 + 2) % (y % 100 + 1)) + (1 - (y % 400 + 2) % (y % 400 + 1))) / x) +
                Math.floor(1/x) - Math.floor(((1 - (y % 4 + 2) % (y % 4 + 1)) *
                ((y % 100 + 2) % (y % 100 + 1)) + (1 - (y % 400 + 2) % (y % 400 + 1)))/x);
    }

    public String getNameMonth(int numberMonth){
        String[] month = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
        return month[numberMonth];
    }
}
