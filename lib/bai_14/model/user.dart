class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final String companyTitle;
  final String companyName;
  final String address;
  final String birthDate;
  final String gender;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.companyTitle,
    required this.companyName,
    required this.address,
    required this.birthDate,
    required this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      companyTitle: json['company'] != null ? json['company']['title'] : 'N/A',
      companyName: json['company'] != null ? json['company']['name'] : 'N/A',
      address: json['address'] != null
          ? "${json['address']['address']}, ${json['address']['city']}"
          : 'N/A',
    );
  }
}
