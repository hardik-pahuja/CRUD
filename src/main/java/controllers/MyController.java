package controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.StudentDao;
import dao.StudentDaoImpl;
import dao.UserDao;
import dao.UserDaoImpl;
import model.Student;
import model.User;

@Controller
public class MyController {
	
	@Autowired
	StudentDao sdao;
	
	@Autowired
	UserDao userdao;
	
	public MyController() {
		sdao = new StudentDaoImpl();
		userdao = new UserDaoImpl();
	}
	@RequestMapping("/")
	public String home()
	{
		return "index";
	}
	@RequestMapping("/aboutus")
	public String about()
	{
		return "AboutUs";
	}
	
	@RequestMapping("/addStudent")
	public ModelAndView openForm()
	{
		return new ModelAndView("AddNewStudent", "stu", new Student());
	}
	
	@RequestMapping(value = "/saveStudent" , method=RequestMethod.POST )
	public String saveStudent(@Valid @ModelAttribute("stu") Student ob, BindingResult b)
	{
		if(b.hasErrors()) {
			return "AddNewStudent";
		}
		
		System.out.println(ob.getId()+"\t"+ob.getName()+"\t"+ob.getAddress()+"\t"+ob.getCourse());
		sdao.create(ob);
		return "success";
	}
	@RequestMapping("/showAll")
	public ModelAndView showAllStudent()
	{
		ModelAndView model = new ModelAndView();
		List<Student> data = sdao.showAllStudents();
		model.addObject("allData",data);
		model.setViewName("AllStudents");
		return model;
		
	}
	@RequestMapping(value="/deleteStudent" , method = RequestMethod.GET)
	public String deleteStudentById(@RequestParam(value="id") int id)
	{
		System.out.println("ID = "+id);
		sdao.deleteStudentById(id);
		return "redirect:/showAll";
	}
	
	@RequestMapping(value="/editStudent" , method = RequestMethod.GET)
	public ModelAndView updateStudent(@RequestParam("id") int id)
	{
		ModelAndView model = new ModelAndView();
		Student data = sdao.fetchStudent(id);
		model.addObject("data",data);
		model.setViewName("update");
		return model;
		
//		System.out.println(ob.getId()+"\t"+ob.getName()+"\t"+ob.getAddress()+"\t"+ob.getCourse());
		/*
		 * sdao.update(ob); return "redirect:/showAll";
		 */
	}
	@RequestMapping(value = "/updateStudentToDB", method=RequestMethod.POST)
      public String upadteStudentTODB(@Valid @ModelAttribute("data") Student ob, BindingResult b)
      
      {
		if(b.hasErrors()) {
			return "update";
		}
		
		sdao.update(ob);
		return "redirect:/showAll";
		
      }
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model)
	{
		return "login";
	}
	
	@RequestMapping(value="/accessdenied", method = RequestMethod.GET)
	public String loginerror(ModelMap model)
	{
		model.addAttribute("error", "true");
		return "denied";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model)
	{
		return "logout";
	}
	
	@RequestMapping("/addUser")
	public ModelAndView openUserForm()
	{
		return new ModelAndView("Register", "user", new User());
	}
	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST )
	public String saveUser(@ModelAttribute("user") User ob)
	{
		userdao.saveUser(ob);
		return "userAdded";
	}
}
