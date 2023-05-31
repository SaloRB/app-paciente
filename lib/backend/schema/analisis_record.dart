import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalisisRecord extends FirestoreRecord {
  AnalisisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  bool hasHora() => _hora != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "cancelado" field.
  bool? _cancelado;
  bool get cancelado => _cancelado ?? false;
  bool hasCancelado() => _cancelado != null;

  // "motivo_cancelacion" field.
  String? _motivoCancelacion;
  String get motivoCancelacion => _motivoCancelacion ?? '';
  bool hasMotivoCancelacion() => _motivoCancelacion != null;

  void _initializeFields() {
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _hora = snapshotData['hora'] as DateTime?;
    _tipo = snapshotData['tipo'] as String?;
    _cancelado = snapshotData['cancelado'] as bool?;
    _motivoCancelacion = snapshotData['motivo_cancelacion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('analisis');

  static Stream<AnalisisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalisisRecord.fromSnapshot(s));

  static Future<AnalisisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalisisRecord.fromSnapshot(s));

  static AnalisisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalisisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalisisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnalisisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalisisRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createAnalisisRecordData({
  DocumentReference? paciente,
  DateTime? hora,
  String? tipo,
  bool? cancelado,
  String? motivoCancelacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paciente': paciente,
      'hora': hora,
      'tipo': tipo,
      'cancelado': cancelado,
      'motivo_cancelacion': motivoCancelacion,
    }.withoutNulls,
  );

  return firestoreData;
}
