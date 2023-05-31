import '/backend/backend.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recordatorios_model.dart';
export 'recordatorios_model.dart';

class RecordatoriosWidget extends StatefulWidget {
  const RecordatoriosWidget({Key? key}) : super(key: key);

  @override
  _RecordatoriosWidgetState createState() => _RecordatoriosWidgetState();
}

class _RecordatoriosWidgetState extends State<RecordatoriosWidget> {
  late RecordatoriosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordatoriosModel());

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
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: true,
          title: Text(
            'Recordatorios',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFFFAFAFA),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    indicatorColor: FlutterFlowTheme.of(context).primaryText,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.medical_services,
                          size: 35.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      ),
                      Tab(
                        icon: FaIcon(
                          FontAwesomeIcons.flask,
                          size: 30.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      ),
                      Tab(
                        icon: FaIcon(
                          FontAwesomeIcons.pills,
                          size: 35.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      StreamBuilder<List<CitasRecord>>(
                        stream: queryCitasRecord(
                          queryBuilder: (citasRecord) => citasRecord
                              .where('paciente',
                                  isEqualTo: FFAppState().currentUserRef)
                              .where('hora', isGreaterThan: getCurrentTimestamp)
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
                          List<CitasRecord> listViewCitasRecordList =
                              snapshot.data!;
                          if (listViewCitasRecordList.isEmpty) {
                            return EmptyListWidget(
                              mensaje: 'No tienes Citas Médicas próximas',
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewCitasRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewCitasRecord =
                                  listViewCitasRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: StreamBuilder<MedicosRecord>(
                                  stream: MedicosRecord.getDocument(
                                      listViewCitasRecord.medico!),
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
                                    final containerMedicosRecord =
                                        snapshot.data!;
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x25000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Container(
                                              width: 4.0,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (functions
                                                      .isInLessThanXHours(
                                                          listViewCitasRecord
                                                              .hora!,
                                                          24)) {
                                                    return Color(0xA8FF0000);
                                                  } else if (functions
                                                      .isInLessThanAWeek(
                                                          listViewCitasRecord
                                                              .hora!)) {
                                                    return Color(0xFFEBEB3B);
                                                  } else {
                                                    return Color(0xFF39D2C0);
                                                  }
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 16.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cita con ${containerMedicosRecord.nombre}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    containerMedicosRecord
                                                        .especialidad,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions.isInLessThanXHours(
                                                              listViewCitasRecord
                                                                  .hora!,
                                                              24)
                                                          ? functions.formatDate(
                                                              listViewCitasRecord
                                                                  .hora,
                                                              false,
                                                              false,
                                                              true)
                                                          : functions.relativeTime(
                                                              listViewCitasRecord
                                                                  .hora
                                                                  ?.toString()),
                                                      'Fecha',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      StreamBuilder<List<AnalisisRecord>>(
                        stream: queryAnalisisRecord(
                          queryBuilder: (analisisRecord) => analisisRecord
                              .where('paciente',
                                  isEqualTo: FFAppState().currentUserRef)
                              .where('cancelado', isEqualTo: false)
                              .where('hora', isGreaterThan: getCurrentTimestamp)
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
                          List<AnalisisRecord> listViewAnalisisRecordList =
                              snapshot.data!;
                          if (listViewAnalisisRecordList.isEmpty) {
                            return EmptyListWidget(
                              mensaje: 'No tienes Análisis próximos',
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAnalisisRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAnalisisRecord =
                                  listViewAnalisisRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x25000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: Container(
                                          width: 4.0,
                                          height: 90.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (functions.isInLessThanXHours(
                                                  listViewAnalisisRecord.hora!,
                                                  24)) {
                                                return Color(0xA8FF0000);
                                              } else if (functions
                                                  .isInLessThanAWeek(
                                                      listViewAnalisisRecord
                                                          .hora!)) {
                                                return Color(0xFFEBEB3B);
                                              } else {
                                                return Color(0xFF39D2C0);
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 16.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cita ${listViewAnalisisRecord.tipo}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.isInLessThanXHours(
                                                          listViewAnalisisRecord
                                                              .hora!,
                                                          24)
                                                      ? functions.formatDate(
                                                          listViewAnalisisRecord
                                                              .hora,
                                                          false,
                                                          false,
                                                          true)
                                                      : functions.relativeTime(
                                                          listViewAnalisisRecord
                                                              .hora
                                                              ?.toString()),
                                                  'Fecha',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF090F13),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      StreamBuilder<List<MedicamentoRecord>>(
                        stream: queryMedicamentoRecord(
                          queryBuilder: (medicamentoRecord) => medicamentoRecord
                              .where('paciente',
                                  isEqualTo: FFAppState().currentUserRef)
                              .where('tomado', isEqualTo: false)
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
                          List<MedicamentoRecord>
                              listViewMedicamentoRecordList = snapshot.data!;
                          if (listViewMedicamentoRecordList.isEmpty) {
                            return EmptyListWidget(
                              mensaje: 'No tienes medicamentos por tomar',
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewMedicamentoRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewMedicamentoRecord =
                                  listViewMedicamentoRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x25000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: Container(
                                          width: 4.0,
                                          height: 90.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (functions.hasTimePassed(
                                                  listViewMedicamentoRecord
                                                      .hora!)) {
                                                return Color(0x80FF0000);
                                              } else if (functions
                                                  .isInLessThanXHours(
                                                      listViewMedicamentoRecord
                                                          .hora!,
                                                      2)) {
                                                return Color(0xFFEBEB3B);
                                              } else {
                                                return Color(0x8039D2C0);
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 16.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewMedicamentoRecord.nombre,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                functions.relativeTime(
                                                    listViewMedicamentoRecord
                                                        .hora
                                                        ?.toString()),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF090F13),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
