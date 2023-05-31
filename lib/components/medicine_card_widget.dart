import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medicine_card_model.dart';
export 'medicine_card_model.dart';

class MedicineCardWidget extends StatefulWidget {
  const MedicineCardWidget({
    Key? key,
    this.nombre,
    this.cantidad,
    this.forma,
    this.frecuencia,
    this.duracion,
    this.viaAdministracion,
  }) : super(key: key);

  final String? nombre;
  final String? cantidad;
  final String? forma;
  final String? frecuencia;
  final String? duracion;
  final String? viaAdministracion;

  @override
  _MedicineCardWidgetState createState() => _MedicineCardWidgetState();
}

class _MedicineCardWidgetState extends State<MedicineCardWidget> {
  late MedicineCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicineCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: Text(
                        widget.nombre!,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                      ),
                    ),
                    Text(
                      widget.cantidad!,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
                Text(
                  widget.forma!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  widget.frecuencia!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.duracion,
                    'duracion',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  'Via Administración: ${widget.viaAdministracion}',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??= false,
                onChanged: (newValue) async {
                  setState(() => _model.checkboxValue = newValue!);
                },
                activeColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
