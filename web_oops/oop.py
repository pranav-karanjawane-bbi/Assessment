class Person:
    def __init__(self, name, age, gender):
        self.name = name
        self.age = age
        self.gender = gender
        
    def introduce(self):
        print(f"Hi my name is {self.name}, I am {self.age} years old! and I am a {self.gender}.")
    
class Student(Person):
    def __init__(self, name, age, gender, student_id):
        super().__init__(name, age, gender)
        self.student_id = student_id
        
class Teacher(Person):
    def __init__(self, name, age, gender, subject):
        super().__init__(name, age, gender)
        self.subject = subject
        
student = Student("Pranav", 21, "Male", "1234")
teacher = Teacher("Raviraj", 23, "Male", "Maths")

student.introduce()
print(f"My student_id is {student.student_id}.")
teacher.introduce()
print(f"My favorite subject is {teacher.subject}.")
        
        
        