enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  // Constructor
  Address(this._street, this._city, this._zipCode);

  // Getter
  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() => '$_street, $_city, $_zipCode';
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final Address _address;
  final int _yearsOfExperience;

  // Constructor
  Employee(
    this._name, 
    this._baseSalary,
    this._skill,
    this._address,
    this._yearsOfExperience,
  );

  // Named Constructor
  Employee.mobileDeveloper(
    String name, 
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _address = address,
      _skill = [Skill.FLUTTER, Skill.DART],
      _yearsOfExperience = yearsOfExperience;

  // Getter
  String get getName => _name;
  double get getBaseSalary => _baseSalary;
  List<Skill> get getSkill => _skill;
  Address get getAddress => _address;
  int get getYearsOfExperience => _yearsOfExperience;

  // Method to compute salary
  double computeSalary() {
    double totalSalary = getBaseSalary + (getYearsOfExperience * 2000);

    if(getSkill.contains(Skill.FLUTTER)) {
      totalSalary += 5000;
    }

    if(getSkill.contains(Skill.DART)) {
      totalSalary += 3000;
    }

    if(getSkill.contains(Skill.OTHER)) {
      totalSalary += 1000;
    }
    return totalSalary;
  }

  void printDetails() {
    print('Employee: $getName \nBase Salary: \$${getBaseSalary} \nAddress: $getAddress \nYear of Experience: $getYearsOfExperience');
    print('Skills: ${_skill.map((s) => s.name).join(", ")}');
    print('Total Salary: \$${computeSalary()}\n');
  }
}

void main() {
  var addr1 = Address("Street 271, Toul Tom Poung", "Phnom Penh", "12310");
  var emp1 = Employee('Sokea', 40000, [Skill.DART], addr1, 2);
  emp1.printDetails();

  var addr2 = Address("Wat Bo Road, Sala Kamreuk", "Siem Reap", "17252");
  var emp2 = Employee('Ronan', 45000, [Skill.OTHER], addr2, 4);
  emp2.printDetails();

  var addr3 = Address("Street 1.5, Svay Por", "Battambang", "02000");
  var emp3 = Employee.mobileDeveloper("Navid", 50000, addr3, 5);
  emp3.printDetails();

}