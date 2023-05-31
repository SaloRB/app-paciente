import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/option_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().profileSelected) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Selecciona un paciente antes de continuar',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                fontSize: 18.0,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Colors.black,
          ),
        );

        context.pushNamed(
          'SeleccionaPaciente',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(FFAppState().currentUserRef!),
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
        final homePageUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF5F5F5),
            appBar: AppBar(
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              title: Text(
                homePageUsersRecord.displayName,
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFFAFAFA),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().currentUserRef = FirebaseFirestore.instance
                          .doc('/users/wpjOPh5kwhVBHNSk2lud3Yc8SdA3');
                      FFAppState().profileSelected = false;
                    });
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('login', context.mounted);
                  },
                ),
              ],
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
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Expediente');
                                        },
                                        child: wrapWithModel(
                                          model: _model.expedienteCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Expediente',
                                            subtitle:
                                                '${homePageUsersRecord.genero} - ${homePageUsersRecord.edad.toString()} años',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/pjuufw1z4g0e/expediente.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Citas');
                                        },
                                        child: wrapWithModel(
                                          model: _model.citasCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Citas',
                                            subtitle: 'Citas del paciente',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/20kvcke2u139/cita.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Doctores',
                                            queryParams: {
                                              'doctores': serializeParam(
                                                homePageUsersRecord.medicos,
                                                ParamType.DocumentReference,
                                                true,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.doctoresCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Doctores',
                                            subtitle:
                                                'Que atienden a este paciente',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/ah0okasq4zyz/doctor.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context
                                              .pushNamed('MedicinaPreventiva');
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .medicinaPreventivaCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Medicina Preventiva',
                                            subtitle: 'Posibles enfermedades',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/em8mhx2d3bvz/preventiva.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('PlanTratamiento');
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.planTratamientoCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Plan de Tratamiento',
                                            subtitle:
                                                'Medicamentos que se deben tomar',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/ai4blkikf5tz/medicamento.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Permisos');
                                          },
                                          child: wrapWithModel(
                                            model: _model.permisosCardModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: OptionCardWidget(
                                              title: 'Permisos del Expediente',
                                              subtitle:
                                                  'Da o quita permisos a medicos e instituciones',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/389xm805l5vj/seguridad.png',
                                              icon: Icon(
                                                Icons.settings,
                                              ),
                                              notificationCount: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('AllChats');
                                        },
                                        child: wrapWithModel(
                                          model: _model.chatCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Chat',
                                            subtitle:
                                                'Conversaciones con medicos',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/u1r8xnz3w6v8/mail.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Recordatorios');
                                        },
                                        child: wrapWithModel(
                                          model: _model.recordatoriosCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: 'Recordatorios',
                                            subtitle: 'Citas y medicamentos',
                                            icon: Icon(
                                              Icons.attach_email,
                                              size: 28.0,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Triage');
                                        },
                                        child: wrapWithModel(
                                          model: _model.triageCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: OptionCardWidget(
                                            title: '¿Debo ir a urgencias?',
                                            subtitle:
                                                'Ver si es necesario ir al hospital',
                                            image:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/pacientes-ar1soy/assets/h261snyxzkca/triage.png',
                                            icon: Icon(
                                              Icons.settings,
                                            ),
                                            notificationCount: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FutureBuilder<int>(
                                        future: queryEncuestasRecordCount(
                                          queryBuilder: (encuestasRecord) =>
                                              encuestasRecord
                                                  .where('paciente',
                                                      isEqualTo: FFAppState()
                                                          .currentUserRef)
                                                  .where('contestada',
                                                      isEqualTo: false),
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
                                          int encuestasCardCount =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Satisfaccion');
                                            },
                                            child: wrapWithModel(
                                              model: _model.encuestasCardModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: OptionCardWidget(
                                                title:
                                                    'Encuestas de Satisfacción',
                                                subtitle: 'Responder encuestas',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.smile,
                                                  size: 28.0,
                                                ),
                                                notificationCount:
                                                    valueOrDefault<int>(
                                                  encuestasCardCount,
                                                  0,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
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
            ),
          ),
        );
      },
    );
  }
}
