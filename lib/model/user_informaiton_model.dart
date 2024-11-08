import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformationModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  UserInformationModel(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  );

  factory UserInformationModel.fromDocument(DocumentSnapshot doc) {
    return UserInformationModel(
      doc.id,
      doc.get('firstName'),
      doc.get('lastName'),
      doc.get('email'),
      doc.get('password'),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'email' : email,
      'password' : password,
    };
  }
}
