import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicosRecord extends FirestoreRecord {
  MedicosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "especialidad" field.
  String? _especialidad;
  String get especialidad => _especialidad ?? '';
  bool hasEspecialidad() => _especialidad != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "horario_atencion" field.
  String? _horarioAtencion;
  String get horarioAtencion => _horarioAtencion ?? '';
  bool hasHorarioAtencion() => _horarioAtencion != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _especialidad = snapshotData['especialidad'] as String?;
    _foto = snapshotData['foto'] as String?;
    _horarioAtencion = snapshotData['horario_atencion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicos');

  static Stream<MedicosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicosRecord.fromSnapshot(s));

  static Future<MedicosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicosRecord.fromSnapshot(s));

  static MedicosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicosRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMedicosRecordData({
  String? nombre,
  String? especialidad,
  String? foto,
  String? horarioAtencion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'especialidad': especialidad,
      'foto': foto,
      'horario_atencion': horarioAtencion,
    }.withoutNulls,
  );

  return firestoreData;
}
