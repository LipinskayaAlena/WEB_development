package by.bsu.famcs.lipinskaya.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by User on 18.12.2015.
 */
@Controller
public class MonthController {

    @RequestMapping(value = "/month", method = RequestMethod.GET)
    public ModelAndView getLogin(HttpServletRequest request) {
        Date date = new Date();
        ModelAndView modelAndView = null;
        if(date.getMonth() + 1 == 12) {
            modelAndView = new ModelAndView("../../WEB-INF/pages/december");
        }
        return modelAndView;
    }
}
