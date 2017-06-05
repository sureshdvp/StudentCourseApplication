package com.studapp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.studapp.entity.Student;
import com.studapp.service.StudentService;

@RestController
public class StudentCourseController {
	
	@Autowired
	private StudentService studentService;
	
	public StudentService getStudentService() {
		return studentService;
	}


	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}


	@RequestMapping("/getUniversities")
	public String viewUniversities(HttpServletRequest request) throws IOException{
		
		return getFile("world_universities_and_domains.txt");
	}

	
	@RequestMapping("/fetchRegisteredStudents")
	public List<Student> viewRegisteredStudents(){
		List<Student> students =studentService.findAllStudents();
		return students;
	}
	
	@RequestMapping(value="/registerStudent", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	public String registerStudent(@RequestBody Student student) {
		
		 studentService.saveStudent(student);
		 
		return "Student Registered successfull";
	}
	
	@RequestMapping(value="/updateStudent", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	public String updateStudent(@RequestBody Student student) {
		
		 studentService.saveStudent(student);
		 
		return "Student Registered successfull";
	}
	
	@RequestMapping(value="/deleteStudent", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
	public String deleteStudent(@RequestBody Student student) {
		
		 studentService.saveStudent(student);
		 
		return "Student Registered successfull";
	}
	
	
	
	private String getFile(String fileName) {

		StringBuilder result = new StringBuilder("");

		//Get file from resources folder
		ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource(fileName).getFile());

		try (Scanner scanner = new Scanner(file)) {

			while (scanner.hasNextLine()) {
				String line = scanner.nextLine();
				result.append(line).append("\n");
			}

			scanner.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result.toString();

	  }
	

}
