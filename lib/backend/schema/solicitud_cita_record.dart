import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolicitudCitaRecord extends FirestoreRecord {
  SolicitudCitaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "fecha_de" field.
  DateTime? _fechaDe;
  DateTime? get fechaDe => _fechaDe;
  bool hasFechaDe() => _fechaDe != null;

  // "fecha_a" field.
  DateTime? _fechaA;
  DateTime? get fechaA => _fechaA;
  bool hasFechaA() => _fechaA != null;

  // "estatus" field.
  String? _estatus;
  String get estatus => _estatus ?? '';
  bool hasEstatus() => _estatus != null;

  // "cita_anterior" field.
  DocumentReference? _citaAnterior;
  DocumentReference? get citaAnterior => _citaAnterior;
  bool hasCitaAnterior() => _citaAnterior != null;

  // "motivo" field.
  String? _motivo;
  String get motivo => _motivo ?? '';
  bool hasMotivo() => _motivo != null;

  // "especialidad" field.
  String? _especialidad;
  String get especialidad => _especialidad ?? '';
  bool hasEspecialidad() => _especialidad != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  void _initializeFields() {
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _fechaDe = snapshotData['fecha_de'] as DateTime?;
    _fechaA = snapshotData['fecha_a'] as DateTime?;
    _estatus = snapshotData['estatus'] as String?;
    _citaAnterior = snapshotData['cita_anterior'] as DocumentReference?;
    _motivo = snapshotData['motivo'] as String?;
    _especialidad = snapshotData['especialidad'] as String?;
    _tipo = snapshotData['tipo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('solicitud_cita');

  static Stream<SolicitudCitaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SolicitudCitaRecord.fromSnapshot(s));

  static Future<SolicitudCitaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SolicitudCitaRecord.fromSnapshot(s));

  static SolicitudCitaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SolicitudCitaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SolicitudCitaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SolicitudCitaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SolicitudCitaRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSolicitudCitaRecordData({
  DocumentReference? paciente,
  DateTime? fechaDe,
  DateTime? fechaA,
  String? estatus,
  DocumentReference? citaAnterior,
  String? motivo,
  String? especialidad,
  String? tipo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paciente': paciente,
      'fecha_de': fechaDe,
      'fecha_a': fechaA,
      'estatus': estatus,
      'cita_anterior': citaAnterior,
      'motivo': motivo,
      'especialidad': especialidad,
      'tipo': tipo,
    }.withoutNulls,
  );

  return firestoreData;
}
