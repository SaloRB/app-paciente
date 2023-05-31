import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EncuestasRecord extends FirestoreRecord {
  EncuestasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "subtitulo" field.
  String? _subtitulo;
  String get subtitulo => _subtitulo ?? '';
  bool hasSubtitulo() => _subtitulo != null;

  // "calificacion" field.
  String? _calificacion;
  String get calificacion => _calificacion ?? '';
  bool hasCalificacion() => _calificacion != null;

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "contestada" field.
  bool? _contestada;
  bool get contestada => _contestada ?? false;
  bool hasContestada() => _contestada != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _subtitulo = snapshotData['subtitulo'] as String?;
    _calificacion = snapshotData['calificacion'] as String?;
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _descripcion = snapshotData['descripcion'] as String?;
    _contestada = snapshotData['contestada'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('encuestas');

  static Stream<EncuestasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EncuestasRecord.fromSnapshot(s));

  static Future<EncuestasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EncuestasRecord.fromSnapshot(s));

  static EncuestasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EncuestasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EncuestasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EncuestasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EncuestasRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createEncuestasRecordData({
  String? titulo,
  String? subtitulo,
  String? calificacion,
  DocumentReference? paciente,
  String? descripcion,
  bool? contestada,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'subtitulo': subtitulo,
      'calificacion': calificacion,
      'paciente': paciente,
      'descripcion': descripcion,
      'contestada': contestada,
    }.withoutNulls,
  );

  return firestoreData;
}
