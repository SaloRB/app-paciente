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
import 'satisfaccion_detalle_model.dart';
export 'satisfaccion_detalle_model.dart';

class SatisfaccionDetalleWidget extends StatefulWidget {
  const SatisfaccionDetalleWidget({
    Key? key,
    required this.encuestaRef,
  }) : super(key: key);

  final DocumentReference? encuestaRef;

  @override
  _SatisfaccionDetalleWidgetState createState() =>
      _SatisfaccionDetalleWidgetState();
}

class _SatisfaccionDetalleWidgetState extends State<SatisfaccionDetalleWidget> {
  late SatisfaccionDetalleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SatisfaccionDetalleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<EncuestasRecord>(
      stream: EncuestasRecord.getDocument(widget.encuestaRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRipple(
                color: Colors.black,
                size: 50.0,
              ),
            ),
          );
        }
        final satisfaccionDetalleEncuestasRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF5F5F5),
            appBar: AppBar(
              backgroundColor: Colors.black,
              automaticallyImplyLeading: true,
              title: Text(
                'Encuesta de Satisfacción',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFAFAFA),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Color(0x2F1D2429),
                      offset: Offset(0.0, 3.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              satisfaccionDetalleEncuestasRecord.descripcion,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.opcion = '5';
                                });
                              },
                              child: wrapWithModel(
                                model: _model.surveyCardModel1,
                                updateCallback: () => setState(() {}),
                                child: SurveyCardWidget(
                                  text: 'EXCELENTE',
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/app-paciente-9jiz1z/assets/i9tsbziit9z7/happy2.png',
                                  color: valueOrDefault<Color>(
                                    _model.opcion == '5'
                                        ? Color(0xFF007900)
                                        : Color(0x00000000),
                                    Color(0xFF007900),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.opcion = '4';
                                });
                              },
                              child: wrapWithModel(
                                model: _model.surveyCardModel2,
                                updateCallback: () => setState(() {}),
                                child: SurveyCardWidget(
                                  text: 'BUENO',
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/app-paciente-9jiz1z/assets/yhay4xmb1ev4/smile2.png',
                                  color: valueOrDefault<Color>(
                                    _model.opcion == '4'
                                        ? Color(0xFF00FF00)
                                        : Color(0x00000000),
                                    Color(0xFF00FF00),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.opcion = '3';
                                });
                              },
                              child: wrapWithModel(
                                model: _model.surveyCardModel3,
                                updateCallback: () => setState(() {}),
                                child: SurveyCardWidget(
                                  text: 'REGULAR',
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/app-paciente-9jiz1z/assets/1rnww8eb2jc2/expressionless2.png',
                                  color: valueOrDefault<Color>(
                                    _model.opcion == '3'
                                        ? Color(0xFFFFC40C)
                                        : Color(0x00000000),
                                    Color(0xFFFFC40C),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.opcion = '2';
                                });
                              },
                              child: wrapWithModel(
                                model: _model.surveyCardModel4,
                                updateCallback: () => setState(() {}),
                                child: SurveyCardWidget(
                                  text: 'MALO',
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/app-paciente-9jiz1z/assets/78wuc2kfeigp/sad2.png',
                                  color: valueOrDefault<Color>(
                                    _model.opcion == '2'
                                        ? Color(0xFFFF7F00)
                                        : Color(0x00000000),
                                    Color(0xFFFF7F00),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.opcion = '1';
                              });
                            },
                            child: wrapWithModel(
                              model: _model.surveyCardModel5,
                              updateCallback: () => setState(() {}),
                              child: SurveyCardWidget(
                                text: 'MUY MALO',
                                image:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/app-paciente-9jiz1z/assets/fntzojotqqsh/angry2.png',
                                color: valueOrDefault<Color>(
                                  _model.opcion == '1'
                                      ? Color(0xFFFF0000)
                                      : Color(0x00000000),
                                  Color(0xFFFF0000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.opcion == '-1') {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text(
                                      'Selecciona una opción para poder continuar'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('ACEPTAR'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            final encuestasUpdateData =
                                createEncuestasRecordData(
                              contestada: true,
                              calificacion: _model.opcion,
                            );
                            await widget.encuestaRef!
                                .update(encuestasUpdateData);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Respuesta Enviada'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('ACEPTAR'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed('HomePage');
                          }
                        },
                        text: 'Enviar Respuesta',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
