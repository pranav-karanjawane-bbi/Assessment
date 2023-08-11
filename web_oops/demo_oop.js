class Person {
    constructor (name, age, gender){
        this.name = name;
        this.age = age;
        this.gender = gender;
    }
    Introduce(){
        console.log('Hi my name is ' + this.name + ', I am ' + this.age + ' years old, and i am a ' + this.gender + '.');
    }
}

class Student extends Person {
    constructor (name, age, gender, student_id){
        super(name, age, gender);
        this.student_id = student_id;
    }
    student_show(){
        console.log( this.Introduce());
        console.log('My student_id is '+ this.student_id);
    }
}

class Teacher extends Person {
    constructor (name, age, gender, subject){
        super(name, age, gender);
        this.subject = subject;
    }
    teacher_show(){
        console.log( this.Introduce());
        console.log('My favorite subject is '+ this.subject);
    }
}

const student = new Student("Pranav", 21, "Male", "345");
const teacher = new Teacher("Raviraj", 23, "Male", "984");

student.student_show();
teacher.teacher_show();