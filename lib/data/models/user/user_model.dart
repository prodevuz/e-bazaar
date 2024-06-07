import 'package:cloud_firestore/cloud_firestore.dart'; // Cloud Firestore package for database operations.
import 'package:ebazaar/utils/formatters/formatter.dart'; // Formatter utility for formatting data.
import 'package:ebazaar/utils/constants/image_strings.dart'; // Image strings for default profile picture.

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.lastName,
    required this.firstName,
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

  String get fullName => '$firstName $lastName'; // Concatenate first and last names.
  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber); // Format phone number.

  // Split full name into parts and generate username in lower camel case.
  static List<String> nameParts(fullName) => fullName.split(" ");
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "ads_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Factory constructor to create UserModel from document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    if (data.data() != null) {
      return UserModel(
        id: data.id,
        firstName: data["firstName"] ?? '',
        lastName: data["lastName"] ?? '',
        username: data["username"] ?? '',
        email: data["email"] ?? '',
        phoneNumber: data["phoneNumber"] ?? '',
        profilePicture: data["profilePicture"] ?? ADImages.user,
      );
    } else {
      return empty();
    }
  }

  // Convert UserModel to JSON format.
  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "profilePicture": profilePicture,
      };

  // Create an empty UserModel.
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
