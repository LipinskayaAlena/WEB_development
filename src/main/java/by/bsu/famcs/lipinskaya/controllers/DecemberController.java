package by.bsu.famcs.lipinskaya.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by User on 18.12.2015.
 */
@Controller
public class DecemberController {

    @RequestMapping(value = "/december", method = RequestMethod.GET)
    public ModelAndView getLogin(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("../../WEB-INF/pages/december");
        return modelAndView;
    }
}
