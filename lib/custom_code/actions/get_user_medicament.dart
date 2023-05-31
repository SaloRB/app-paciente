// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> getUserMedicament(String userId) async {
  // Add your function code here!
  List<Map<String, dynamic>> userMedicament = [];

  // Retrieve all documents in the 'medicament' collection
  QuerySnapshot medicamentSnapshot =
      await FirebaseFirestore.instance.collection('medicamento').get();

  // Loop through each document and filter by the userId in the 'pacient' field
  for (QueryDocumentSnapshot doc in medicamentSnapshot.docs) {
    if (doc['paciente'].id == userId) {
      // Add a new item to the 'userMedicament' list with the schema {'medicamentId': 123, 'taken': false}
      Map<String, dynamic> medication = {
        'medicamentId': doc.id,
        'name': doc['nombre'],
        'taken': false,
      };
      userMedicament.add(medication);
    }
  }

  return userMedicament;
}
