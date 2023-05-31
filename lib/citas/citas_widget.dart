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
import 'citas_model.dart';
export 'citas_model.dart';

class CitasWidget extends StatefulWidget {
  const CitasWidget({Key? key}) : super(key: key);

  @override
  _CitasWidgetState createState() => _CitasWidgetState();
}

class _CitasWidgetState extends State<CitasWidget> {
  late CitasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CitasModel());

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: true,
          title: Text(
            'Citas',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFFFAFAFA),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primary,
                          labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                          indicatorColor: Color(0xFF131C21),
                          tabs: [
                            Tab(
                              icon: Icon(
                                Icons.medical_services,
                                color: Color(0xFF131C21),
                                size: 40.0,
                              ),
                              iconMargin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                            ),
                            Tab(
                              icon: FaIcon(
                                FontAwesomeIcons.flask,
                                color: Color(0xFF131C21),
                                size: 35.0,
                              ),
                              iconMargin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Text(
                                      'Citas Médicas',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StreamBuilder<List<CitasRecord>>(
                                            stream: queryCitasRecord(
                                              queryBuilder: (citasRecord) =>
                                                  citasRecord
                                                      .where(
                                                          'paciente',
                                                          isEqualTo: FFAppState()
                                                              .currentUserRef)
                                                      .where('hora',
                                                          isGreaterThan:
                                                              getCurrentTimestamp)
                                                      .orderBy('hora'),
                                            ),
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
                                              List<CitasRecord>
                                                  listViewCitasRecordList =
                                                  snapshot.data!;
                                              if (listViewCitasRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child: EmptyListWidget(
                                                    mensaje:
                                                        'No tienes citas pendientes...',
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewCitasRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewCitasRecord =
                                                      listViewCitasRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: StreamBuilder<
                                                        MedicosRecord>(
                                                      stream: MedicosRecord
                                                          .getDocument(
                                                              listViewCitasRecord
                                                                  .medico!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: Colors
                                                                    .black,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final appointmentCardMedicosRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'CitaDetalle',
                                                              queryParams: {
                                                                'citaRef':
                                                                    serializeParam(
                                                                  listViewCitasRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'medicoRef':
                                                                    serializeParam(
                                                                  appointmentCardMedicosRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .appointmentCardModels
                                                                .getModel(
                                                              listViewCitasRecord
                                                                  .reference.id,
                                                              listViewIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                AppointmentCardWidget(
                                                              key: Key(
                                                                'Key8yz_${listViewCitasRecord.reference.id}',
                                                              ),
                                                              nombre:
                                                                  appointmentCardMedicosRecord
                                                                      .nombre,
                                                              especialidad:
                                                                  appointmentCardMedicosRecord
                                                                      .especialidad,
                                                              fecha:
                                                                  listViewCitasRecord
                                                                      .hora,
                                                              estatus:
                                                                  listViewCitasRecord
                                                                      .estatus,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Text(
                                      'Solicitudes Activas',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StreamBuilder<
                                              List<SolicitudCitaRecord>>(
                                            stream: querySolicitudCitaRecord(
                                              queryBuilder: (solicitudCitaRecord) =>
                                                  solicitudCitaRecord
                                                      .where('paciente',
                                                          isEqualTo: FFAppState()
                                                              .currentUserRef)
                                                      .whereIn('estatus', [
                                                'pendiente',
                                                'reprogramacion'
                                              ]).orderBy('fecha_de'),
                                            ),
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
                                              List<SolicitudCitaRecord>
                                                  listViewSolicitudCitaRecordList =
                                                  snapshot.data!;
                                              if (listViewSolicitudCitaRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child: EmptyListWidget(
                                                    mensaje:
                                                        'No tienes solicitudes pendientes...',
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewSolicitudCitaRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewSolicitudCitaRecord =
                                                      listViewSolicitudCitaRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .applicationCardModels
                                                          .getModel(
                                                        listViewSolicitudCitaRecord
                                                            .reference.id,
                                                        listViewIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          ApplicationCardWidget(
                                                        key: Key(
                                                          'Keylnk_${listViewSolicitudCitaRecord.reference.id}',
                                                        ),
                                                        especialidad:
                                                            listViewSolicitudCitaRecord
                                                                .especialidad,
                                                        estatus:
                                                            listViewSolicitudCitaRecord
                                                                .estatus,
                                                        fechaDe:
                                                            listViewSolicitudCitaRecord
                                                                .fechaDe,
                                                        fechaA:
                                                            listViewSolicitudCitaRecord
                                                                .fechaA,
                                                        tipo:
                                                            listViewSolicitudCitaRecord
                                                                .tipo,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed('CitaNueva');
                                            },
                                            text: 'Solicitar Nueva Cita',
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: Text(
                                      'Análisis',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StreamBuilder<List<AnalisisRecord>>(
                                            stream: queryAnalisisRecord(
                                              queryBuilder: (analisisRecord) =>
                                                  analisisRecord
                                                      .where('paciente',
                                                          isEqualTo: FFAppState()
                                                              .currentUserRef)
                                                      .where('cancelado',
                                                          isEqualTo: false)
                                                      .where('hora',
                                                          isGreaterThan:
                                                              getCurrentTimestamp)
                                                      .orderBy('hora'),
                                            ),
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
                                              List<AnalisisRecord>
                                                  listViewAnalisisRecordList =
                                                  snapshot.data!;
                                              if (listViewAnalisisRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child: EmptyListWidget(
                                                    mensaje:
                                                        'No tienes analisis pendientes...',
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewAnalisisRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewAnalisisRecord =
                                                      listViewAnalisisRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .labAppointmentCardModels
                                                          .getModel(
                                                        listViewAnalisisRecord
                                                            .reference.id,
                                                        listViewIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          LabAppointmentCardWidget(
                                                        key: Key(
                                                          'Keykz4_${listViewAnalisisRecord.reference.id}',
                                                        ),
                                                        tipo:
                                                            listViewAnalisisRecord
                                                                .tipo,
                                                        fecha:
                                                            listViewAnalisisRecord
                                                                .hora,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
