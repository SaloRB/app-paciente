import '/backend/backend.dart';
import '/components/application_card_widget.dart';
import '/components/appointment_card_widget.dart';
import '/components/empty_list_widget.dart';
import '/components/lab_appointment_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CitasModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Models for AppointmentCard dynamic component.
  late FlutterFlowDynamicModels<AppointmentCardModel> appointmentCardModels;
  // Models for ApplicationCard dynamic component.
  late FlutterFlowDynamicModels<ApplicationCardModel> applicationCardModels;
  // Models for LabAppointmentCard dynamic component.
  late FlutterFlowDynamicModels<LabAppointmentCardModel>
      labAppointmentCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appointmentCardModels =
        FlutterFlowDynamicModels(() => AppointmentCardModel());
    applicationCardModels =
        FlutterFlowDynamicModels(() => ApplicationCardModel());
    labAppointmentCardModels =
        FlutterFlowDynamicModels(() => LabAppointmentCardModel());
  }

  void dispose() {
    appointmentCardModels.dispose();
    applicationCardModels.dispose();
    labAppointmentCardModels.dispose();
  }

  /// Additional helper methods are added here.

}
