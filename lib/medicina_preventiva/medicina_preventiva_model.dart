import '/components/article_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicinaPreventivaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ArticleCard component.
  late ArticleCardModel articleCardModel1;
  // Model for ArticleCard component.
  late ArticleCardModel articleCardModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    articleCardModel1 = createModel(context, () => ArticleCardModel());
    articleCardModel2 = createModel(context, () => ArticleCardModel());
  }

  void dispose() {
    textController?.dispose();
    articleCardModel1.dispose();
    articleCardModel2.dispose();
  }

  /// Additional helper methods are added here.

}
