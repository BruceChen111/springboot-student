package net.wanho.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.wanho.mapper.StudentMapper;
import net.wanho.pojo.Student;
import net.wanho.service.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentServiceI {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> getStus() {

        List<Student> stus = studentMapper.getStus();
        return stus;
    }

    @Override
    public PageInfo<Student> getStusByPage(Integer pageNum) {
        PageHelper.startPage(pageNum, 5);
        List<Student> stus = studentMapper.getStus();
        PageInfo<Student> pageInfo = new PageInfo<Student>(stus);
        return pageInfo;
    }
}
