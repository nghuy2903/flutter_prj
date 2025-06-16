class User {
  final int? id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final String dateYear;
  final String gender;

  User({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.dateYear,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'date_year': dateYear,
      'gender': gender,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      name: map['name'],
      phone: map['phone'],
      dateYear: map['date_year'],
      gender: map['gender'],
    );
  }

  User copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? dateYear,
    String? gender,
  }){
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      dateYear: dateYear ?? this.dateYear,
      gender: gender ?? this.gender,
    );
  }

  @override
  String toString(){
    return 'User(id: $id, email: $email, password: $password, name: $name, phone: $phone, dateYear: $dateYear, gender: $gender)';
  }
}