import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/survey_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SatisfaccionDetalleModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String opcion = '-1';

  ///  State fields for stateful widgets in this page.

  // Model for SurveyCard component.
  late SurveyCardModel surveyCardModel1;
  // Model for SurveyCard component.
  late SurveyCardModel surveyCardModel2;
  // Model for SurveyCard component.
  late SurveyCardModel surveyCardModel3;
  // Model for SurveyCard component.
  late SurveyCardModel surveyCardModel4;
  // Model for SurveyCard component.
  late SurveyCardModel surveyCardModel5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    surveyCardModel1 = createModel(context, () => SurveyCardModel());
    surveyCardModel2 = createModel(context, () => SurveyCardModel());
    surveyCardModel3 = createModel(context, () => SurveyCardModel());
    surveyCardModel4 = createModel(context, () => SurveyCardModel());
    surveyCardModel5 = createModel(context, () => SurveyCardModel());
  }

  void dispose() {
    surveyCardModel1.dispose();
    surveyCardModel2.dispose();
    surveyCardModel3.dispose();
    surveyCardModel4.dispose();
    surveyCardModel5.dispose();
  }

  /// Additional helper methods are added here.

}
