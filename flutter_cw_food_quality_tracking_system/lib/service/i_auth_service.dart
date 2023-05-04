import 'package:flutter_cw_food_quality_tracking_system/core/model/my_app_user.dart';

abstract class IAuthService {
  Future<MyAppUser> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<MyAppUser> signInEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Stream<MyAppUser?> get onAuthStateChange; //kullanıcı hala online mi kontrolü
}
