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
import 'plan_tratamiento_model.dart';
export 'plan_tratamiento_model.dart';

class PlanTratamientoWidget extends StatefulWidget {
  const PlanTratamientoWidget({Key? key}) : super(key: key);

  @override
  _PlanTratamientoWidgetState createState() => _PlanTratamientoWidgetState();
}

class _PlanTratamientoWidgetState extends State<PlanTratamientoWidget> {
  late PlanTratamientoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanTratamientoModel());

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
            'Plan de Tratamiento',
            style: FlutterFlowTheme.of(context).displaySmall.override(
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
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  color: Color(0x2F1D2429),
                  offset: Offset(0.0, 3.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Builder(
                    builder: (context) {
                      final medicamentList = functions
                              .getUserMedicaments(
                                  FFAppState().currentUserRef!.id)
                              ?.toList() ??
                          [];
                      if (medicamentList.isEmpty) {
                        return EmptyListWidget(
                          mensaje: 'No hay un plan de tratamiento',
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: medicamentList.length,
                        itemBuilder: (context, medicamentListIndex) {
                          final medicamentListItem =
                              medicamentList[medicamentListIndex];
                          return wrapWithModel(
                            model: _model.medicineCardModels.getModel(
                              getJsonField(
                                medicamentListItem,
                                r'''$.medicamentId''',
                              ).toString(),
                              medicamentListIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: MedicineCardWidget(
                              key: Key(
                                'Keyvog_${getJsonField(
                                  medicamentListItem,
                                  r'''$.medicamentId''',
                                ).toString()}',
                              ),
                              nombre: getJsonField(
                                medicamentListItem,
                                r'''$.name''',
                              ).toString(),
                              cantidad: getJsonField(
                                medicamentListItem,
                                r'''$.qty''',
                              ).toString(),
                              forma: getJsonField(
                                medicamentListItem,
                                r'''$.form''',
                              ).toString(),
                              frecuencia: getJsonField(
                                medicamentListItem,
                                r'''$.frequency''',
                              ).toString(),
                              duracion: getJsonField(
                                medicamentListItem,
                                r'''$.duration''',
                              ).toString(),
                              viaAdministracion: getJsonField(
                                medicamentListItem,
                                r'''$.route''',
                              ).toString(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE0E0E0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 6.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.safePop();
                                },
                                text: 'Cancelar',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).cancel,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Registro Correcto'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('ACEPTAR'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  context.safePop();
                                },
                                text: 'Registrar',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accept,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
