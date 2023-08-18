class Employee {
  String? userId ;
  String? jobTitleName;
  String? firstName;
  String? lastName;
  String? preferredFullName;
  String? employeeCode;
  String? region;
  String? phoneNumber;
  String? emailAddress;
  
  Employee ({this.userId, this.jobTitleName, this.firstName, this.lastName, this.preferredFullName, this.employeeCode, this.region,this.phoneNumber, this.emailAddress});
  
  Employee.fromJson(Map<String, dynamic> data){
    userId = data['userId'];
    jobTitleName = data['jobTitleName'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    preferredFullName = data['preferredFullName'];
    employeeCode = data['employeeCode'];
    region = data['data'];
    phoneNumber = data['phoneNumber'];
    emailAddress = data['emailAddress'];
    
  }
  
  
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> info = {};
    info['userId'] = userId;
    info['jobTitleName'] = jobTitleName;
    info['firstName'] = firstName;
    info['lastName'] = lastName;
    info['preferredFullName'] = preferredFullName;
    info['employeeCode'] = employeeCode;
    info['region'] = region;
    info['phoneNumber'] = phoneNumber;
    info['emailAddress'] = emailAddress;
    return info;
  }
  
}


void main() {
  
  Map<String, dynamic> data = {

"userId":"rirani",

"jobTitleName":"Developer",

"firstName":"Romin",

"lastName":"Irani",

"preferredFullName":"Romin Irani",

"employeeCode":"E1",

"region":"CA",

"phoneNumber":"408-1234567",

"emailAddress":"romin.k.irani@gmail.com"

 };  
  Employee emp = Employee.fromJson(data);
  
  print(emp.toJson());
}

