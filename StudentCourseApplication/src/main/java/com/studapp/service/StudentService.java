package com.studapp.service;

import java.util.List;

import com.studapp.entity.Student;

public interface StudentService {
	
	void saveStudent(Student student);
	 
    void updateStudent(Student user);
 
    void deleteStudentById(Long id);
 
    void deleteAllStudents();
 
    List<Student> findAllStudents();

}
