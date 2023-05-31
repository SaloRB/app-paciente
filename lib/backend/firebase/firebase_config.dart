import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCvWR_nLT5F2eQ_6S2qk7dDEVCTXSc8eAY",
            authDomain: "mwpaciente.firebaseapp.com",
            projectId: "mwpaciente",
            storageBucket: "mwpaciente.appspot.com",
            messagingSenderId: "937214609893",
            appId: "1:937214609893:web:ad6f0a5ebd8869a5acc70c"));
  } else {
    await Firebase.initializeApp();
  }
}
