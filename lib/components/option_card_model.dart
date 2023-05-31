import '/components/notification_badge_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionCardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for NotificationBadge component.
  late NotificationBadgeModel notificationBadgeModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notificationBadgeModel =
        createModel(context, () => NotificationBadgeModel());
  }

  void dispose() {
    notificationBadgeModel.dispose();
  }

  /// Additional helper methods are added here.

}
