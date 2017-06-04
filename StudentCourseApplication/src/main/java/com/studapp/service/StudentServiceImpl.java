package com.studapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studapp.entity.Student;
import com.studapp.repositories.StudentRepository;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
	@Autowired
    private StudentRepository studentRepository;

	public StudentRepository getStudentRepository() {
		return studentRepository;
	}

	public void setStudentRepository(StudentRepository studentRepository) {
		this.studentRepository = studentRepository;
	}

	@Override
	public void saveStudent(Student student) {
		studentRepository.save(student);
		
	}

	@Override
	public void updateStudent(Student student) {
		studentRepository.save(student);
		
	}

	@Override
	public void deleteStudentById(Long id) {
		studentRepository.delete(id);
	}

	@Override
	public void deleteAllStudents() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Student> findAllStudents() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
