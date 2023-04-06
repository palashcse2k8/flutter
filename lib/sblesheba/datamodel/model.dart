class Customer {
  static const String name = "Md. Mosiur Rahman";
  static const String fathersName = "Md. Faruqe Talukder";
  static const String mothersName = "Majeda Begum";
  static const String spouseName = "Israt Jahan Hema";
  static const String dateOfBirth = "01-15-1990";
  static const String gender = "Male";
  static const String profession = "Banker";
  static const String permanentAddress = "Shibpur, Dashpara, Daudkandi, Cumilla";
  static const String presentAddress = "Dhanmondi, Dhaka";

  static const String nameOfBranch = "Business IT, ITD";
  static const String accountNumber = "1312801024500";
  static const String mobileNumber = "01726925300";
  static const String email = "palashcse2k8@gmail.com";
  static const String nid = "19904174075000348";
  static const String tin = "134481972349";

  static const String nomineeName = "Israt Jahan Hema";
  static const String nomineeShare = "100";
  static const String nomineeDateofBirth = "12-01-1991";
  static const String nomineeNidBRC = "19904174075000348";
  static const String nomineePresentAddress = "Dhanmondi, Dhaka";
  static const String nomineeRelation = "Wife";
  static const String nomineeImage = "assets/images/nominee.png";


  static const String customerImage = 'assets/images/customer.png';
  static const String customerNidFront = 'assets/images/nid-front-side.png';
  static const String customerNidBack = 'assets/images/nid-back-side.png';

  static const String customerSignature = 'assets/images/customer-signature.png';
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}
