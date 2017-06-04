package com.studapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studapp.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {

}
