ArrayList<Student> students = new ArrayList<Student>();
int xPos, yPos, margin=50;

void setup() {
    size(400, 400);
    fill(0);
    textSize(20);

    initializeStudents();
}

void initializeStudents(){
    students.add(new Student(569, "Nick", "Peterson"));
    //add courses for Nick
    students.get(0).addCourse(new Course("C01", "Physics", 7.5));
    students.get(0).addCourse(new Course("C02", "Chemistry", 9));
    students.get(0).addCourse(new Course("C03", "Programming", 6.5));

    students.add(new Student(555, "Jan", "Smulders"));
    //add courses for Jan
    students.get(1).addCourse(new Course("C01", "Physics", 7.5));
    students.get(1).addCourse(new Course("C02", "Chemistry", 9));    
}

void draw() {
    xPos=10;
    yPos=30;
    background(255);
    for (int i = 0; i < students.size(); i++){
        students.get(i).display(xPos, yPos);
        yPos+=margin * students.get(i).getNumCourses();
    }
}
