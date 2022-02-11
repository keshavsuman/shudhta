part of ecommerce;

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String? firebaseId;
  String? firebaseToken;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.firebaseId,
    this.firebaseToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      firebaseId: json['firebaseId'],
      firebaseToken: json['firebaseToken'],
    );
  }
}
