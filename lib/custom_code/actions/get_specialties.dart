// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> getSpecialties(String userId) async {
  // Add your function code here!
  List<String> specialties = [];

  // Get the User document
  DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  // Get the list of Medic references from the User document
  List<DocumentReference> medicRefs =
      List<DocumentReference>.from(userSnapshot['medicos']);

  // Loop through the Medic references and get the specialties
  for (DocumentReference medicRef in medicRefs) {
    DocumentSnapshot medicSnapshot = await medicRef.get();
    String specialty = medicSnapshot['especialidad'];
    if (!specialties.contains(specialty)) {
      specialties.add(specialty);
    }
  }

  return specialties;
}
