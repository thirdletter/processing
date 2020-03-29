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

    void display(int xPos, int yPos){
        String student=id + " " + name + " " + surname;
        text(student, xPos, yPos);

        showCourses(xPos + 50, yPos + 50);
    }

    void showCourses(int xPos, int yPos){
        String temp = "";

        //add the courses inside of the string
        for (int i = 0; i < courses.size(); i++){
            temp += courses.get(i).display() + "\n";
        }
        text(temp, xPos, yPos);
    }

    void addCourse(Course c){
        courses.add(c);
    }

    int getNumCourses(){
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

    String display(){
        return id + " " + name + " " + grade;
    }
}