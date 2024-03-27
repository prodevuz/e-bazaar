import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);
  static List<String> nameParts(fullName) => fullName.split(" ");

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    if (data.data() != null) {
      return UserModel(
        id: data.id,
        firstName: data["FirstName"] ?? '',
        lastName: data["LastName"] ?? '',
        username: data["Username"] ?? '',
        email: data["Email"] ?? '',
        phoneNumber: data["PhoneNumber"] ?? '',
        profilePicture: data["ProfilePicture"] ?? '',
      );
    } else {
      return empty();
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "profilePicture": profilePicture,
      };

  static UserModel empty() => UserModel(id: "", firstName: "", lastName: "", username: "", email: "", phoneNumber: "", profilePicture: "");
}
