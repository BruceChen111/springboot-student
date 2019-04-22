package net.wanho.service;

import com.github.pagehelper.PageInfo;
import net.wanho.pojo.Student;

import java.util.List;

public interface StudentServiceI {

    List<Student> getStus();
    PageInfo<Student> getStusByPage(Integer pageNum);
}
