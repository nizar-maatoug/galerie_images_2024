import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:galerie_image_2024/firebase_options.dart';

class FirebaseService {
  final _firebaseAuth = FirebaseAuth.instance;
  //Ajouter les autres service (store,...)
  final _firebaseStorage = FirebaseStorage.instance;

  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseService();
  }

  FirebaseAuth getAuth() {
    return _firebaseAuth;
  }

  FirebaseStorage getStorage() {
    return _firebaseStorage;
  }
}
