import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Example_Students extends PApplet {

ArrayList<Student> students = new ArrayList<Student>();
int xPos, yPos, margin=50;

public void setup() {
    
    fill(0);
    textSize(20);

    initializeStudents();
}

public void initializeStudents(){
    students.add(new Student(569, "Nick", "Peterson"));
    //add courses for Nick
    students.get(0).addCourse(new Course("C01", "Physics", 7.5f));
    students.get(0).addCourse(new Course("C02", "Chemistry", 9));
    students.get(0).addCourse(new Course("C03", "Programming", 6.5f));

    students.add(new Student(555, "Jan", "Smulders"));
    //add courses for Jan
    students.get(1).addCourse(new Course("C01", "Physics", 7.5f));
    students.get(1).addCourse(new Course("C02", "Chemistry", 9));    
}

public void draw() {
    xPos=10;
    yPos=30;
    background(255);
    for (int i = 0; i < students.size(); i++){
        students.get(i).display(xPos, yPos);
        yPos+=margin * students.get(i).getNumCourses();
    }
}
class Student{
    private int id;
    private String name;
    private String surname;
    private ArrayList<Course> courses = new ArrayList<Course>(); // this is the composition part of ex.

    //const
    Student(int id, String name, String surname){
        this.id = id;
        this.name = name;
        this.surname = surname;
    }

    public void display(int xPos, int yPos){
        String student=id + " " + name + " " + surname;
        text(student, xPos, yPos);

        showCourses(xPos + 50, yPos + 50);
    }

    public void showCourses(int xPos, int yPos){
        String temp = "";

        //add the courses inside of the string
        for (int i = 0; i < courses.size(); i++){
            temp += courses.get(i).display() + "\n";
        }
        text(temp, xPos, yPos);
    }

    public void addCourse(Course c){
        courses.add(c);
    }

    public int getNumCourses(){
        return courses.size();
    }
}

class Course{
    private String id;
    private String name;
    private float grade;

    //const
    Course(String id, String name, float grade){
        this.id = id;
        this.name = name;
        this.grade = grade;
    }

    public String display(){
        return id + " " + name + " " + grade;
    }
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Example_Students" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
