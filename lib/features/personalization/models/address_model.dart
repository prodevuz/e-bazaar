import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebazaar/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String region;
  final String postalCode;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.region,
    required this.postalCode,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() =>
      AddressModel(id: '', name: '', phoneNumber: '', street: '', city: '', region: '', postalCode: '');

  Map<String, dynamic> toJson() => {
        "Name": name,
        "PhoneNumber": phoneNumber,
        "Street": street,
        "City": city,
        "Region": region,
        "PostalCode": postalCode,
        "DateTime": DateTime.now(),
        "SelectedAddress": selectedAddress,
      };

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        id: data["Id"] as String,
        name: data["Name"] as String,
        phoneNumber: data["PhoneNumber"] as String,
        street: data["Street"] as String,
        city: data["City"] as String,
        region: data["Region"] as String,
        postalCode: data["PostalCode"] as String,
        selectedAddress: data["SelectedAddress"] as bool,
        dateTime: (data["DateTime"] as Timestamp).toDate(),
      );

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
      id: snapshot.id,
      name: data["Name"] ?? '',
      phoneNumber: data["PhoneNumber"] ?? '',
      street: data["Street"] ?? '',
      city: data["City"] ?? '',
      region: data["Region"] ?? '',
      postalCode: data["PostalCode"] ?? '',
      selectedAddress: data["SelectedAddress"] ?? false,
      dateTime: (data["DateTime"] as Timestamp).toDate(),
    );
  }

  @override
  String toString() => '$region, $city, $street, $postalCode';
}
