package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
    @GetMapping("/")
    public String hello(){
        return "homePage";
    }
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)

    public String login(Model model) {
        model.addAttribute("onLoginPage", true);
        return "login";
    }
    @GetMapping("/contact")
    public String contact(){
        return "contactPage";
    }
}
