import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/option_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ExpedienteCard.
  late OptionCardModel expedienteCardModel;
  // Model for CitasCard.
  late OptionCardModel citasCardModel;
  // Model for DoctoresCard.
  late OptionCardModel doctoresCardModel;
  // Model for MedicinaPreventivaCard.
  late OptionCardModel medicinaPreventivaCardModel;
  // Model for PlanTratamientoCard.
  late OptionCardModel planTratamientoCardModel;
  // Model for PermisosCard.
  late OptionCardModel permisosCardModel;
  // Model for ChatCard.
  late OptionCardModel chatCardModel;
  // Model for RecordatoriosCard.
  late OptionCardModel recordatoriosCardModel;
  // Model for TriageCard.
  late OptionCardModel triageCardModel;
  // Model for EncuestasCard.
  late OptionCardModel encuestasCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    expedienteCardModel = createModel(context, () => OptionCardModel());
    citasCardModel = createModel(context, () => OptionCardModel());
    doctoresCardModel = createModel(context, () => OptionCardModel());
    medicinaPreventivaCardModel = createModel(context, () => OptionCardModel());
    planTratamientoCardModel = createModel(context, () => OptionCardModel());
    permisosCardModel = createModel(context, () => OptionCardModel());
    chatCardModel = createModel(context, () => OptionCardModel());
    recordatoriosCardModel = createModel(context, () => OptionCardModel());
    triageCardModel = createModel(context, () => OptionCardModel());
    encuestasCardModel = createModel(context, () => OptionCardModel());
  }

  void dispose() {
    expedienteCardModel.dispose();
    citasCardModel.dispose();
    doctoresCardModel.dispose();
    medicinaPreventivaCardModel.dispose();
    planTratamientoCardModel.dispose();
    permisosCardModel.dispose();
    chatCardModel.dispose();
    recordatoriosCardModel.dispose();
    triageCardModel.dispose();
    encuestasCardModel.dispose();
  }

  /// Additional helper methods are added here.

}
