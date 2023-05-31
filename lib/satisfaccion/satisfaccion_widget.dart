import '/backend/backend.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'satisfaccion_model.dart';
export 'satisfaccion_model.dart';

class SatisfaccionWidget extends StatefulWidget {
  const SatisfaccionWidget({Key? key}) : super(key: key);

  @override
  _SatisfaccionWidgetState createState() => _SatisfaccionWidgetState();
}

class _SatisfaccionWidgetState extends State<SatisfaccionWidget> {
  late SatisfaccionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SatisfaccionModel());

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
            'Encuestas de Satisfacción',
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
            child: StreamBuilder<List<EncuestasRecord>>(
              stream: queryEncuestasRecord(
                queryBuilder: (encuestasRecord) => encuestasRecord
                    .where('paciente', isEqualTo: FFAppState().currentUserRef)
                    .where('contestada', isEqualTo: false),
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
                List<EncuestasRecord> listViewEncuestasRecordList =
                    snapshot.data!;
                if (listViewEncuestasRecordList.isEmpty) {
                  return EmptyListWidget(
                    mensaje: 'No tienes encuestas por contestar',
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewEncuestasRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewEncuestasRecord =
                        listViewEncuestasRecordList[listViewIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'SatisfaccionDetalle',
                          queryParams: {
                            'encuestaRef': serializeParam(
                              listViewEncuestasRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          listViewEncuestasRecord.titulo,
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        subtitle: Text(
                          listViewEncuestasRecord.subtitulo,
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).accent2,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
