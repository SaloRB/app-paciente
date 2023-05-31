import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosticosRecord extends FirestoreRecord {
  DiagnosticosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _descripcion = snapshotData['descripcion'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('diagnosticos')
          : FirebaseFirestore.instance.collectionGroup('diagnosticos');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('diagnosticos').doc();

  static Stream<DiagnosticosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiagnosticosRecord.fromSnapshot(s));

  static Future<DiagnosticosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiagnosticosRecord.fromSnapshot(s));

  static DiagnosticosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiagnosticosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiagnosticosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiagnosticosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiagnosticosRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createDiagnosticosRecordData({
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}
