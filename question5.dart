// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
// TODO: Complete the following requirements:

// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // TODO: Calculate total salary (base + bonus)
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    // TODO: Process payment
    print("Processing payment of \$${amount.toStringAsFixed(2)}...");
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // TODO: Generate report
    return "Monthly report for $employeeName in $department department";
  }
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()
abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    print("$name (ID: $id, Department: $department)");
    print("  Job Title: ${getJobTitle()}");
    print("  Base Salary: \$${getBaseSalary().toStringAsFixed(2)}");
  }
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize) : super(name, id, department);

  @override
  String getJobTitle() {
    // TODO: Return manager job title
    return "Manager";
  }

  @override
  double getBaseSalary() {
    // TODO: Return manager base salary
    return 8000.0;
  }

  @override
  void displayInfo() {
    // TODO: Override to show manager-specific info
    super.displayInfo();
    print("  Team Size: $teamSize");
  }
}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage) : super(name, id, department);

  @override
  String getJobTitle() {
    // TODO: Return developer job title
    return "Senior Developer";
  }

  @override
  double getBaseSalary() {
    // TODO: Return developer base salary
    return 6000.0;
  }

  @override
  void displayInfo() {
    // TODO: Override to show developer-specific info
    super.displayInfo();
    print("  Programming Language: $programmingLanguage");
  }
}

void main() {
  // 5. Create employees and demonstrate:
  //    - Salary calculation with bonus
  //    - Payment processing
  //    - Report generation (for managers)
  //    - Display all employee information

  // TODO: Create employees (using values from test cases)
  Manager manager = Manager("John Smith", "M001", "IT", 5);
  Developer developer = Developer("Alice Johnson", "D001", "IT", "Dart");

  // TODO: Display employee information
  print("*** Employee Information ***");
  manager.displayInfo();
  print("");
  developer.displayInfo();
  print("");

  // TODO: Demonstrate salary calculation with bonus
  print("\n*** Salary Calculation ***");
  double managerSalary = manager.calculateSalary(manager.getBaseSalary(), 1000.0);
  double devSalary = developer.calculateSalary(developer.getBaseSalary(), 5000.0);
  print("${manager.name} Total Salary: \$${managerSalary.toStringAsFixed(2)}");
  print("${developer.name} Total Salary: \$${devSalary.toStringAsFixed(2)}");

  // TODO: Demonstrate payment processing
  print("\n*** Payment Processing ***");
  manager.processPayment(managerSalary);
  developer.processPayment(devSalary);

  // TODO: Demonstrate report generation (for managers)
  print("\n*** Report Generation ***");
  String report = manager.generateReport(manager.name, manager.department);
  print(report);
}