import '/components/empty_list_widget.dart';
import '/components/medicine_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanTratamientoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Models for MedicineCard dynamic component.
  late FlutterFlowDynamicModels<MedicineCardModel> medicineCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    medicineCardModels = FlutterFlowDynamicModels(() => MedicineCardModel());
  }

  void dispose() {
    medicineCardModels.dispose();
  }

  /// Additional helper methods are added here.

}
