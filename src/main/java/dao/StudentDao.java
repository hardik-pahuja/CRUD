package dao;

import java.util.List;

import model.Student;

public interface StudentDao {
	public void create(Student ob);
	public List<Student> showAllStudents();
	public void deleteStudentById(int id);
	public Student fetchStudent(int id);
	public boolean update(Student stu);

}
