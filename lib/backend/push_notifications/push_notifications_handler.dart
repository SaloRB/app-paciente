import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: Colors.black,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'login': ParameterData.none(),
  'register': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'Citas': ParameterData.none(),
  'CitaDetalle': (data) async => ParameterData(
        allParams: {
          'citaRef': getParameter<DocumentReference>(data, 'citaRef'),
          'medicoRef': getParameter<DocumentReference>(data, 'medicoRef'),
        },
      ),
  'CancelarCita': (data) async => ParameterData(
        allParams: {
          'citaRef': getParameter<DocumentReference>(data, 'citaRef'),
        },
      ),
  'ReagendarCita': (data) async => ParameterData(
        allParams: {
          'citaRef': getParameter<DocumentReference>(data, 'citaRef'),
          'especialidad': getParameter<String>(data, 'especialidad'),
        },
      ),
  'CitaNueva': ParameterData.none(),
  'Expediente': ParameterData.none(),
  'Doctores': (data) async => ParameterData(
        allParams: {},
      ),
  'MedicinaPreventiva': ParameterData.none(),
  'MedicinaPreventivaArticulo': (data) async => ParameterData(
        allParams: {
          'titulo': getParameter<String>(data, 'titulo'),
          'texto': getParameter<String>(data, 'texto'),
        },
      ),
  'PlanTratamiento': ParameterData.none(),
  'Permisos': ParameterData.none(),
  'SeleccionaPaciente': ParameterData.none(),
  'CentrosSalud': ParameterData.none(),
  'Mapa': ParameterData.none(),
  'Recordatorios': ParameterData.none(),
  'Cuenta': ParameterData.none(),
  'Triage': ParameterData.none(),
  'Chat': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChats': ParameterData.none(),
  'Satisfaccion': ParameterData.none(),
  'SatisfaccionDetalle': (data) async => ParameterData(
        allParams: {
          'encuestaRef': getParameter<DocumentReference>(data, 'encuestaRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
