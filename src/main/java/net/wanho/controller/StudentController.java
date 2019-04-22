package net.wanho.controller;

import com.github.pagehelper.PageInfo;
import net.wanho.pojo.Student;
import net.wanho.service.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class StudentController {

    @Autowired
    private StudentServiceI studentServiceI;


    @RequestMapping("getStus")
    public String getStus(Map map) {

        List<Student> stus = studentServiceI.getStus();

        map.put("stus", stus);
        return "student";
    }


    @RequestMapping("getStusByPage")
    public String getStusByPage(Map map,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum) {

        PageInfo<Student> pageInfo = studentServiceI.getStusByPage(pageNum);

        map.put("pageInfo", pageInfo);
        return "student";
    }
}
