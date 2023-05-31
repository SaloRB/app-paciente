import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "curp" field.
  String? _curp;
  String get curp => _curp ?? '';
  bool hasCurp() => _curp != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "edad" field.
  int? _edad;
  int get edad => _edad ?? 0;
  bool hasEdad() => _edad != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "tipo_sanguineo" field.
  String? _tipoSanguineo;
  String get tipoSanguineo => _tipoSanguineo ?? '';
  bool hasTipoSanguineo() => _tipoSanguineo != null;

  // "depende_de" field.
  DocumentReference? _dependeDe;
  DocumentReference? get dependeDe => _dependeDe;
  bool hasDependeDe() => _dependeDe != null;

  // "dependientes" field.
  List<DocumentReference>? _dependientes;
  List<DocumentReference> get dependientes => _dependientes ?? const [];
  bool hasDependientes() => _dependientes != null;

  // "medicos" field.
  List<DocumentReference>? _medicos;
  List<DocumentReference> get medicos => _medicos ?? const [];
  bool hasMedicos() => _medicos != null;

  // "talla" field.
  String? _talla;
  String get talla => _talla ?? '';
  bool hasTalla() => _talla != null;

  // "es_medico" field.
  bool? _esMedico;
  bool get esMedico => _esMedico ?? false;
  bool hasEsMedico() => _esMedico != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _curp = snapshotData['curp'] as String?;
    _genero = snapshotData['genero'] as String?;
    _edad = snapshotData['edad'] as int?;
    _peso = castToType<double>(snapshotData['peso']);
    _tipoSanguineo = snapshotData['tipo_sanguineo'] as String?;
    _dependeDe = snapshotData['depende_de'] as DocumentReference?;
    _dependientes = getDataList(snapshotData['dependientes']);
    _medicos = getDataList(snapshotData['medicos']);
    _talla = snapshotData['talla'] as String?;
    _esMedico = snapshotData['es_medico'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? curp,
  String? genero,
  int? edad,
  double? peso,
  String? tipoSanguineo,
  DocumentReference? dependeDe,
  String? talla,
  bool? esMedico,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'created_time': createdTime,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'curp': curp,
      'genero': genero,
      'edad': edad,
      'peso': peso,
      'tipo_sanguineo': tipoSanguineo,
      'depende_de': dependeDe,
      'talla': talla,
      'es_medico': esMedico,
    }.withoutNulls,
  );

  return firestoreData;
}
