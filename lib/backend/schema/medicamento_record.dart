import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicamentoRecord extends FirestoreRecord {
  MedicamentoRecord._(
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

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "tomado" field.
  bool? _tomado;
  bool get tomado => _tomado ?? false;
  bool hasTomado() => _tomado != null;

  // "cantidad" field.
  String? _cantidad;
  String get cantidad => _cantidad ?? '';
  bool hasCantidad() => _cantidad != null;

  // "forma" field.
  String? _forma;
  String get forma => _forma ?? '';
  bool hasForma() => _forma != null;

  // "frecuencia" field.
  String? _frecuencia;
  String get frecuencia => _frecuencia ?? '';
  bool hasFrecuencia() => _frecuencia != null;

  // "duracion" field.
  String? _duracion;
  String get duracion => _duracion ?? '';
  bool hasDuracion() => _duracion != null;

  // "via_administracion" field.
  String? _viaAdministracion;
  String get viaAdministracion => _viaAdministracion ?? '';
  bool hasViaAdministracion() => _viaAdministracion != null;

  void _initializeFields() {
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _hora = snapshotData['hora'] as DateTime?;
    _nombre = snapshotData['nombre'] as String?;
    _tomado = snapshotData['tomado'] as bool?;
    _cantidad = snapshotData['cantidad'] as String?;
    _forma = snapshotData['forma'] as String?;
    _frecuencia = snapshotData['frecuencia'] as String?;
    _duracion = snapshotData['duracion'] as String?;
    _viaAdministracion = snapshotData['via_administracion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicamento');

  static Stream<MedicamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicamentoRecord.fromSnapshot(s));

  static Future<MedicamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicamentoRecord.fromSnapshot(s));

  static MedicamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicamentoRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMedicamentoRecordData({
  DocumentReference? paciente,
  DateTime? hora,
  String? nombre,
  bool? tomado,
  String? cantidad,
  String? forma,
  String? frecuencia,
  String? duracion,
  String? viaAdministracion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paciente': paciente,
      'hora': hora,
      'nombre': nombre,
      'tomado': tomado,
      'cantidad': cantidad,
      'forma': forma,
      'frecuencia': frecuencia,
      'duracion': duracion,
      'via_administracion': viaAdministracion,
    }.withoutNulls,
  );

  return firestoreData;
}
