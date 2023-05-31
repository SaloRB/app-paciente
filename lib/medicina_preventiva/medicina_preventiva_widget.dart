import '/components/article_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medicina_preventiva_model.dart';
export 'medicina_preventiva_model.dart';

class MedicinaPreventivaWidget extends StatefulWidget {
  const MedicinaPreventivaWidget({Key? key}) : super(key: key);

  @override
  _MedicinaPreventivaWidgetState createState() =>
      _MedicinaPreventivaWidgetState();
}

class _MedicinaPreventivaWidgetState extends State<MedicinaPreventivaWidget> {
  late MedicinaPreventivaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicinaPreventivaModel());

    _model.textController ??= TextEditingController();
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
            'Medicina Preventiva',
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 12.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: Icon(
                              Icons.search_rounded,
                              color: Color(0xFFACB9C4),
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Ingresa tu búsqueda...',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'MedicinaPreventivaArticulo',
                              queryParams: {
                                'titulo': serializeParam(
                                  'La epidemia del matlazahuatl, en la Ciudad de México (1736-1739)',
                                  ParamType.String,
                                ),
                                'texto': serializeParam(
                                  'Las enfermedades y epidemias han acompañado a la especie humana a lo largo de su existencia, por lo que los habitantes de la Ciudad de México padecieron varias durante la época virreinal. Resulta interesante conocer cómo las vivieron y enfrentaron, así como las soluciones médicas, sociales y religiosas que se implementaron durante el desarrollo de la epidemia del matlazahuatl durante 1736-1739. El matlazahuatl En su obra Escudo de armas de México, Cayetano de Cabrera y Quintero1  cuenta que, a finales de agosto de 1736, en el pueblo de Tacuba, comenzó a sentirse entre los sirvientes de un obraje, y posesión de un noble vecino de México, una fiebre que, aunque se creyó fruta del tiempo, juntaba con lo agudo y mortal de la que dispara desde su nociva estación el otoño, lo venenoso y pestilente, con que suele teñirla el estío (Cabrera, 1746: I, 32). De esta manera, se originó una de las más mortíferas y prolongadas epidemias que se padeció en la Ciudad de México durante la época virreinal (véase la Figura 1). El matlazahuatl (en náhuatl), que solía contagiarse por un piojo de la lana, tuvo su origen, en esa ocasión, en un obraje de Tacuba; en pocos días llegó al corazón de la capital de la Nueva España, donde se mantuvo por tres años y mató principalmente a la población indígena. A esta enfermedad también se le llamó cocoliztli, que actualmente se suele identificar como salmonelosis entérica, aunque el matlazahuatl es un tifus exantemático. No obstante, Elsa Malvido y Carlos Viesca (1985: 32) son de la opinión de que se trata del mismo padecimiento porque tenían síntomas muy similares y, además, porque en náhuatl –dicen– cocoliztli quiere decir solamente “enfermedad”, mientras que matlazahuatl se refiere a “bubas en forma de red”; es decir, una afección con una patología concreta. No era la primera vez que se presentaba esta enfermedad en la Ciudad de México. El matlazahuatl, llamado también tabardillo o tabardete, se hizo presente por primera vez en 1545 y se manifestó con “pujamiento de sangre, y juntamente calenturas, y era tanta la sangre, que les reventaba por las narices” (Mendieta, 1997: II, 197-198). En esa ocasión, según cuenta fray Juan de Torquemada (1975: IV, 409), murieron unas 800 000 personas. Más letal aún fue la que se presentó en 1576, que duró casi un año y medio y cobró la vida de “más de dos millones de personas” (Torquemada, 1975: IV, 408). Así, este padecimiento tuvo brotes epidémicos varias veces, pero, al parecer, los que fueron registrados con más amplitud por los cronistas fueron los que más afectaron a la población. Para la epidemia de 1694- 1695 no se conoce el número de fallecimientos, pero se tiene la noticia de su importancia porque como consecuencia de ella murió sor Juana Inés de la Cruz el 17 de abril de 1695.',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: wrapWithModel(
                            model: _model.articleCardModel1,
                            updateCallback: () => setState(() {}),
                            child: ArticleCardWidget(
                              title:
                                  'La epidemia del matlazahuatl en la Ciudad de México (1736, 1739)',
                              summary:
                                  'Las enferemedades y epidemias han acompañado a la especie humana a lo largo de su existencia, por lo que los habitantes de la Ciudad de México padiercieron varias durante la epoca...',
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
                          context.pushNamed(
                            'MedicinaPreventivaArticulo',
                            queryParams: {
                              'titulo': serializeParam(
                                'Hipertensión arterial: la muerte silenciosa',
                                ParamType.String,
                              ),
                              'texto': serializeParam(
                                'Uno de los mayores riesgos para el corazón y la circulación es la hipertensión arterial. A largo plazo afecta al corazón, a los riñones o los ojos, pero también puede provocar un infarto cerebral. La llaman la muerte silenciosa, porque no presenta síntomas. La hipertensión arterial es la enfermedad conocida como “la muerte silenciosa” debido a que hoy en día son millones de personas que padecen esta enfermedad y no lo saben. De acuerdo con datos de The Texas Heart Institute, casi 80 millones de estadounidenses la padecen, y 16 millones no lo saben.  La presión arterial tiene un patrón diario en las personas. Por lo general, empieza a aumentar unas horas antes de despertarse e incrementa llegando a su pico máximo al mediodía. Suele bajar al final de la tarde y en la noche. La presión arterial suele ser menor mientras las personas duermen. De acuerdo con el Instituto Mayo Clinic, hay anormalidad en la presión arterial cuando se sube durante la noche, está alta temprano a la mañana o el descenso en la noche es muy bajo. Un patrón anormal de la tensión, según los especialistas, podría indicar que la persona tiene presión arterial alta mal controlada, apnea obstructiva del sueño, enfermedad renal, diabetes, enfermedad de la tiroides o un trastorno del sistema nervioso.',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: wrapWithModel(
                          model: _model.articleCardModel2,
                          updateCallback: () => setState(() {}),
                          child: ArticleCardWidget(
                            title:
                                'Hipertensión Arterial: la muerte silenciosa',
                            summary:
                                'Uno de los mayores riesgos para el corazón y la circulación es la hipertensíón arterial. A largo plazo afecta el corazón, a los riñones, a los ojos, pero tambien puede provocar un....',
                          ),
                        ),
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
