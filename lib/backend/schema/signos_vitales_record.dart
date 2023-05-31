import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SignosVitalesRecord extends FirestoreRecord {
  SignosVitalesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "paciente" field.
  DocumentReference? _paciente;
  DocumentReference? get paciente => _paciente;
  bool hasPaciente() => _paciente != null;

  // "hora_registro" field.
  DateTime? _horaRegistro;
  DateTime? get horaRegistro => _horaRegistro;
  bool hasHoraRegistro() => _horaRegistro != null;

  // "situacion_actual" field.
  String? _situacionActual;
  String get situacionActual => _situacionActual ?? '';
  bool hasSituacionActual() => _situacionActual != null;

  // "temperatura_corporal" field.
  String? _temperaturaCorporal;
  String get temperaturaCorporal => _temperaturaCorporal ?? '';
  bool hasTemperaturaCorporal() => _temperaturaCorporal != null;

  // "temperatura_tomada_en" field.
  String? _temperaturaTomadaEn;
  String get temperaturaTomadaEn => _temperaturaTomadaEn ?? '';
  bool hasTemperaturaTomadaEn() => _temperaturaTomadaEn != null;

  // "presion_sistolica" field.
  String? _presionSistolica;
  String get presionSistolica => _presionSistolica ?? '';
  bool hasPresionSistolica() => _presionSistolica != null;

  // "presion_diastolica" field.
  String? _presionDiastolica;
  String get presionDiastolica => _presionDiastolica ?? '';
  bool hasPresionDiastolica() => _presionDiastolica != null;

  // "presion_tomada_en" field.
  String? _presionTomadaEn;
  String get presionTomadaEn => _presionTomadaEn ?? '';
  bool hasPresionTomadaEn() => _presionTomadaEn != null;

  // "frecuencia_cardiaca" field.
  String? _frecuenciaCardiaca;
  String get frecuenciaCardiaca => _frecuenciaCardiaca ?? '';
  bool hasFrecuenciaCardiaca() => _frecuenciaCardiaca != null;

  // "frecuencia_respiratoria" field.
  String? _frecuenciaRespiratoria;
  String get frecuenciaRespiratoria => _frecuenciaRespiratoria ?? '';
  bool hasFrecuenciaRespiratoria() => _frecuenciaRespiratoria != null;

  // "saturacion_oxigeno" field.
  String? _saturacionOxigeno;
  String get saturacionOxigeno => _saturacionOxigeno ?? '';
  bool hasSaturacionOxigeno() => _saturacionOxigeno != null;

  // "llenado_capilar" field.
  String? _llenadoCapilar;
  String get llenadoCapilar => _llenadoCapilar ?? '';
  bool hasLlenadoCapilar() => _llenadoCapilar != null;

  // "glicemia_capilar" field.
  String? _glicemiaCapilar;
  String get glicemiaCapilar => _glicemiaCapilar ?? '';
  bool hasGlicemiaCapilar() => _glicemiaCapilar != null;

  // "pre_pandial" field.
  String? _prePandial;
  String get prePandial => _prePandial ?? '';
  bool hasPrePandial() => _prePandial != null;

  // "peso" field.
  String? _peso;
  String get peso => _peso ?? '';
  bool hasPeso() => _peso != null;

  // "talla" field.
  String? _talla;
  String get talla => _talla ?? '';
  bool hasTalla() => _talla != null;

  // "circunferencia_cintura" field.
  String? _circunferenciaCintura;
  String get circunferenciaCintura => _circunferenciaCintura ?? '';
  bool hasCircunferenciaCintura() => _circunferenciaCintura != null;

  void _initializeFields() {
    _paciente = snapshotData['paciente'] as DocumentReference?;
    _horaRegistro = snapshotData['hora_registro'] as DateTime?;
    _situacionActual = snapshotData['situacion_actual'] as String?;
    _temperaturaCorporal = snapshotData['temperatura_corporal'] as String?;
    _temperaturaTomadaEn = snapshotData['temperatura_tomada_en'] as String?;
    _presionSistolica = snapshotData['presion_sistolica'] as String?;
    _presionDiastolica = snapshotData['presion_diastolica'] as String?;
    _presionTomadaEn = snapshotData['presion_tomada_en'] as String?;
    _frecuenciaCardiaca = snapshotData['frecuencia_cardiaca'] as String?;
    _frecuenciaRespiratoria =
        snapshotData['frecuencia_respiratoria'] as String?;
    _saturacionOxigeno = snapshotData['saturacion_oxigeno'] as String?;
    _llenadoCapilar = snapshotData['llenado_capilar'] as String?;
    _glicemiaCapilar = snapshotData['glicemia_capilar'] as String?;
    _prePandial = snapshotData['pre_pandial'] as String?;
    _peso = snapshotData['peso'] as String?;
    _talla = snapshotData['talla'] as String?;
    _circunferenciaCintura = snapshotData['circunferencia_cintura'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('signos_vitales');

  static Stream<SignosVitalesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SignosVitalesRecord.fromSnapshot(s));

  static Future<SignosVitalesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SignosVitalesRecord.fromSnapshot(s));

  static SignosVitalesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SignosVitalesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SignosVitalesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SignosVitalesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SignosVitalesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSignosVitalesRecordData({
  DocumentReference? paciente,
  DateTime? horaRegistro,
  String? situacionActual,
  String? temperaturaCorporal,
  String? temperaturaTomadaEn,
  String? presionSistolica,
  String? presionDiastolica,
  String? presionTomadaEn,
  String? frecuenciaCardiaca,
  String? frecuenciaRespiratoria,
  String? saturacionOxigeno,
  String? llenadoCapilar,
  String? glicemiaCapilar,
  String? prePandial,
  String? peso,
  String? talla,
  String? circunferenciaCintura,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paciente': paciente,
      'hora_registro': horaRegistro,
      'situacion_actual': situacionActual,
      'temperatura_corporal': temperaturaCorporal,
      'temperatura_tomada_en': temperaturaTomadaEn,
      'presion_sistolica': presionSistolica,
      'presion_diastolica': presionDiastolica,
      'presion_tomada_en': presionTomadaEn,
      'frecuencia_cardiaca': frecuenciaCardiaca,
      'frecuencia_respiratoria': frecuenciaRespiratoria,
      'saturacion_oxigeno': saturacionOxigeno,
      'llenado_capilar': llenadoCapilar,
      'glicemia_capilar': glicemiaCapilar,
      'pre_pandial': prePandial,
      'peso': peso,
      'talla': talla,
      'circunferencia_cintura': circunferenciaCintura,
    }.withoutNulls,
  );

  return firestoreData;
}
