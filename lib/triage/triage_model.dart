import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TriageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for situacionActual widget.
  String? situacionActualValue;
  FormFieldController<String>? situacionActualValueController;
  // State field(s) for temperaturaCorporal widget.
  TextEditingController? temperaturaCorporalController;
  String? Function(BuildContext, String?)?
      temperaturaCorporalControllerValidator;
  String? _temperaturaCorporalControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 30 y 44';
    }

    if (!RegExp('^(0)|(3[0-9]|4[0-4])(\\.[1-9])?\$').hasMatch(val)) {
      return 'Ingrese un valor entre 30 y 44';
    }
    return null;
  }

  // State field(s) for temperaturaTomadaEn widget.
  String? temperaturaTomadaEnValue;
  FormFieldController<String>? temperaturaTomadaEnValueController;
  // State field(s) for presionSistolica widget.
  TextEditingController? presionSistolicaController;
  String? Function(BuildContext, String?)? presionSistolicaControllerValidator;
  String? _presionSistolicaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 50 y 300';
    }

    if (!RegExp('^(0|[5-9][0-9]|[1-2][0-9]{2}|300)\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for presionDiastolica widget.
  TextEditingController? presionDiastolicaController;
  String? Function(BuildContext, String?)? presionDiastolicaControllerValidator;
  String? _presionDiastolicaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 20 y 200';
    }

    if (!RegExp('^(0|[2-9][0-9]|1[0-9]{2}|200)\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for presionTomadaEn widget.
  String? presionTomadaEnValue;
  FormFieldController<String>? presionTomadaEnValueController;
  // State field(s) for frecuenciaCardiaca widget.
  TextEditingController? frecuenciaCardiacaController;
  String? Function(BuildContext, String?)?
      frecuenciaCardiacaControllerValidator;
  String? _frecuenciaCardiacaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 40 y 220';
    }

    if (!RegExp('^(0|[4-9][0-9]|1[0-9]{2}|2[0-1][0-9]|220)\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for frecuenciaRespiratoria widget.
  TextEditingController? frecuenciaRespiratoriaController;
  String? Function(BuildContext, String?)?
      frecuenciaRespiratoriaControllerValidator;
  String? _frecuenciaRespiratoriaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 10 y 99';
    }

    if (!RegExp('^(0|[0-9]{2})\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for saturacionOxigeno widget.
  TextEditingController? saturacionOxigenoController;
  String? Function(BuildContext, String?)? saturacionOxigenoControllerValidator;
  String? _saturacionOxigenoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 0 y 100';
    }

    if (!RegExp('^(\\d{1,2}|100)\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for llenadoCapilar widget.
  TextEditingController? llenadoCapilarController;
  String? Function(BuildContext, String?)? llenadoCapilarControllerValidator;
  String? _llenadoCapilarControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 0 y 5';
    }

    if (!RegExp('^(?:[0-4](?:\\.[0-9]+)?|5(?:\\.0+)?)\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for glicemiaCapilar widget.
  TextEditingController? glicemiaCapilarController;
  String? Function(BuildContext, String?)? glicemiaCapilarControllerValidator;
  String? _glicemiaCapilarControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor entre 20 y 999';
    }

    if (!RegExp('^(0|[2-9][0-9]|[1-9][0-9]{2})\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for prePandial widget.
  String? prePandialValue;
  FormFieldController<String>? prePandialValueController;
  // State field(s) for peso widget.
  TextEditingController? pesoController;
  String? Function(BuildContext, String?)? pesoControllerValidator;
  String? _pesoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un valor correcto';
    }

    if (!RegExp('^(1?\\d{1,2}|2[0-9]{2}|3[0-9]{2}|400)(\\.\\d{1,3})?\$')
        .hasMatch(val)) {
      return 'Ingrese un valor correcto';
    }
    return null;
  }

  // State field(s) for talla widget.
  TextEditingController? tallaController;
  String? Function(BuildContext, String?)? tallaControllerValidator;
  // State field(s) for circunferenciaCintura widget.
  TextEditingController? circunferenciaCinturaController;
  String? Function(BuildContext, String?)?
      circunferenciaCinturaControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SignosVitalesRecord? signosRecord;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    temperaturaCorporalControllerValidator =
        _temperaturaCorporalControllerValidator;
    presionSistolicaControllerValidator = _presionSistolicaControllerValidator;
    presionDiastolicaControllerValidator =
        _presionDiastolicaControllerValidator;
    frecuenciaCardiacaControllerValidator =
        _frecuenciaCardiacaControllerValidator;
    frecuenciaRespiratoriaControllerValidator =
        _frecuenciaRespiratoriaControllerValidator;
    saturacionOxigenoControllerValidator =
        _saturacionOxigenoControllerValidator;
    llenadoCapilarControllerValidator = _llenadoCapilarControllerValidator;
    glicemiaCapilarControllerValidator = _glicemiaCapilarControllerValidator;
    pesoControllerValidator = _pesoControllerValidator;
  }

  void dispose() {
    temperaturaCorporalController?.dispose();
    presionSistolicaController?.dispose();
    presionDiastolicaController?.dispose();
    frecuenciaCardiacaController?.dispose();
    frecuenciaRespiratoriaController?.dispose();
    saturacionOxigenoController?.dispose();
    llenadoCapilarController?.dispose();
    glicemiaCapilarController?.dispose();
    pesoController?.dispose();
    tallaController?.dispose();
    circunferenciaCinturaController?.dispose();
  }

  /// Additional helper methods are added here.

}
