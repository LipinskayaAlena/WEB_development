package by.bsu.famcs.lipinskaya.controllers;

import by.bsu.famcs.lipinskaya.model.Person;
import by.bsu.famcs.lipinskaya.services.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
public class PersonController {

    @Autowired
    @Qualifier("authenticationManager")
    private AuthenticationManager authManager;

    @Autowired
    private PersonService personService;

    //@Autowired
   // private PlaceService placeService;

    @RequestMapping(value = "/Registration", method = RequestMethod.GET)
    public ModelAndView getRegistration() {
        return new ModelAndView("../../WEB-INF/pages/Registration");
    }

    @RequestMapping(value = { "/Registration" }, method = RequestMethod.POST)
    public ModelAndView registerUser(@ModelAttribute("user") Person newPerson,
                                     BindingResult result, Errors errors, HttpServletRequest request) {
        Person registered = new Person();
        if (!result.hasErrors()) {
            registered = createUserAccount(newPerson);
        }
        if (registered == null) {
            result.rejectValue("username", "message.regError", "Wrong username or password");
        }
        if (result.hasErrors()) {
            return new ModelAndView("../../WEB-INF/pages/Registration", "error", "Error");
        } else {
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(registered.getUsername(),
                    newPerson.getPassword());

            token.setDetails(new WebAuthenticationDetails(request));
            Authentication authentication = authManager.authenticate(token);

            SecurityContextHolder.getContext().setAuthentication(authentication);

            request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
                    SecurityContextHolder.getContext());
            request.getSession().setAttribute("user", registered);

            ModelAndView modelAndView = new ModelAndView("months/december");

           // List<Place> allPlaces = placeService.getAllPlaces();
           // List<String> photos = new ArrayList<String>();
           // List<Boolean> likedPhotos = new ArrayList<Boolean>();


           // for (Place place : allPlaces) {
           //     photos.add("/photo/" + place.getId());
           //     likedPhotos.add(placeService.isLiked(registered, place.getId()));
           // }




            modelAndView.addObject("user", newPerson);
           // modelAndView.addObject("places", allPlaces);
           // modelAndView.addObject("photos", photos);
           // modelAndView.addObject("likes", likedPhotos);

            return modelAndView;
        }


    }

    private Person createUserAccount(Person newPerson) {
        Person registered;
        try {
            registered = personService.registerNewUserAccount(newPerson);
        } catch (NullPointerException e) {
            return null;
        }
        return registered;
    }
}
