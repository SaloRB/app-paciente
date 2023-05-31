import '/backend/backend.dart';
import '/components/doctor_card_widget.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctores_model.dart';
export 'doctores_model.dart';

class DoctoresWidget extends StatefulWidget {
  const DoctoresWidget({
    Key? key,
    this.doctores,
  }) : super(key: key);

  final List<DocumentReference>? doctores;

  @override
  _DoctoresWidgetState createState() => _DoctoresWidgetState();
}

class _DoctoresWidgetState extends State<DoctoresWidget> {
  late DoctoresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctoresModel());

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
            'Doctores',
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 3.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final doctores = widget.doctores?.toList() ?? [];
                  if (doctores.isEmpty) {
                    return EmptyListWidget(
                      mensaje: 'No tienes doctores asignados...',
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: doctores.length,
                    itemBuilder: (context, doctoresIndex) {
                      final doctoresItem = doctores[doctoresIndex];
                      return StreamBuilder<MedicosRecord>(
                        stream: MedicosRecord.getDocument(doctoresItem),
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
                          final doctorCardMedicosRecord = snapshot.data!;
                          return wrapWithModel(
                            model: _model.doctorCardModels.getModel(
                              doctorCardMedicosRecord.reference.id,
                              doctoresIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: DoctorCardWidget(
                              key: Key(
                                'Keybfb_${doctorCardMedicosRecord.reference.id}',
                              ),
                              nombre: doctorCardMedicosRecord.nombre,
                              especialidad:
                                  doctorCardMedicosRecord.especialidad,
                              foto: doctorCardMedicosRecord.foto,
                              horarioAtencion:
                                  doctorCardMedicosRecord.horarioAtencion,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
