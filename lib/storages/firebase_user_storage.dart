import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_hub/model/user_information_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseUserStorage {
  static final FirebaseUserStorage _singleton = FirebaseUserStorage._internal();

  factory FirebaseUserStorage() {
    return _singleton;
  }

  FirebaseUserStorage._internal();

  final storage = FirebaseFirestore.instance;

  Future<bool> addUserInformation({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    bool result = false;
    try {
      await storage.collection('UsersInformation').doc(const Uuid().v1()).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      });
      result = true;
    } on FirebaseException catch (e) {
      result = false;
      print("Failed with error '${e.code}: '${e.message}'");
    }
    return result;
  }

  // Future<UserInformationModel> getUserInformation({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  // }) async {
  //   final QuerySnapshot userInformationResult =
  //       await storage.collection('UsersInformation').get();
  //   final UserInformationModel result = userInformationResult.docs
  //   return result;
  // }
}
