import '/backend/backend.dart';
import '/components/doctor_card_widget.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctoresModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Models for DoctorCard dynamic component.
  late FlutterFlowDynamicModels<DoctorCardModel> doctorCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    doctorCardModels = FlutterFlowDynamicModels(() => DoctorCardModel());
  }

  void dispose() {
    doctorCardModels.dispose();
  }

  /// Additional helper methods are added here.

}
