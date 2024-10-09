import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  // final String fullName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      'First Name' : firstName,
      'Last Name': lastName,
      'Email': email,
      'Password': password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['First Name'],
      lastName: data['Last Name'],
      email: data['Email'],
      password: data['Password'],
    );
  }

  // Factory method to create UserModel from Firestore document
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      firstName: data['First Name'] ?? '',
      lastName: data['Last Name'] ?? '',
      email: data['Email'] ?? '',
      password: data['Password'] ?? '',
    );
  }

}
