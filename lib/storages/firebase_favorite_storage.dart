import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirebaseFavoriteStorage {
  static final FirebaseFavoriteStorage _singleton = FirebaseFavoriteStorage._internal();

  factory FirebaseFavoriteStorage() {
    return _singleton;
  }

  FirebaseFavoriteStorage._internal();

  final storage = FirebaseFirestore.instance;

  Future<bool> addFavoriteInformation({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    bool result = false;
    try {
      await storage.collection('FavoritesInformation').doc(const Uuid().v1()).set({
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

// Future<FavoriteInformationModel> getFavoriteInformation({
//   required String firstName,
//   required String lastName,
//   required String email,
//   required String password,
// }) async {
//   final QuerySnapshot FavoriteInformationResult =
//       await storage.collection('FavoritesInformation').get();
//   final FavoriteInformationModel result = FavoriteInformationResult.docs
//   return result;
// }
}
