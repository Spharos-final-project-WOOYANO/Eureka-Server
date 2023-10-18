package shparos.server.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/users")
public class TestController{

    @GetMapping("test")
    public String test(){
        return "this is test!!";
    }

    @GetMapping("test2")
    public String test2(){
        return "this is test!!";git
    }
}
