import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/formatters/formatter.dart';
import 'package:ebazaar/utils/constants/image_strings.dart';

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
  String firstName;
  String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  String profilePicture;

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);
  static List<String> nameParts(fullName) => fullName.split(" ");
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "ads_$camelCaseUsername";
    return usernameWithPrefix;
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    if (data.data() != null) {
      return UserModel(
        id: data.id,
        firstName: data["FirstName"] ?? '',
        lastName: data["LastName"] ?? '',
        username: data["Username"] ?? '',
        email: data["Email"] ?? '',
        phoneNumber: data["PhoneNumber"] ?? '',
        profilePicture: data["ProfilePicture"] ?? ADImages.user,
      );
    } else {
      return empty();
    }
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "Username": username,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "ProfilePicture": profilePicture,
      };

  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        profilePicture: ADImages.user,
      );
}
