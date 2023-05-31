import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitasRecord extends FirestoreRecord {
  CitasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  bool hasHora() => _hora != null;

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "medico" field.
  DocumentReference? _medico;
  DocumentReference? get medico => _medico;
  bool hasMedico() => _medico != null;

  // "motivo_cancelacion" field.
  String? _motivoCancelacion;
  String get motivoCancelacion => _motivoCancelacion ?? '';
  bool hasMotivoCancelacion() => _motivoCancelacion != null;

  // "estatus" field.
  String? _estatus;
  String get estatus => _estatus ?? '';
  bool hasEstatus() => _estatus != null;

  void _initializeFields() {
    _hora = snapshotData['hora'] as DateTime?;
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _medico = snapshotData['medico'] as DocumentReference?;
    _motivoCancelacion = snapshotData['motivo_cancelacion'] as String?;
    _estatus = snapshotData['estatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitasRecord.fromSnapshot(s));

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitasRecord.fromSnapshot(s));

  static CitasRecord fromSnapshot(DocumentSnapshot snapshot) => CitasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitasRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCitasRecordData({
  DateTime? hora,
  DocumentReference? paciente,
  DocumentReference? medico,
  String? motivoCancelacion,
  String? estatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hora': hora,
      'paciente': paciente,
      'medico': medico,
      'motivo_cancelacion': motivoCancelacion,
      'estatus': estatus,
    }.withoutNulls,
  );

  return firestoreData;
}
