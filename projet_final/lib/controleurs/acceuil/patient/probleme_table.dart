import 'package:polymer/polymer.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('probleme-table')
class ProblemeTable extends PolymerElement {
  @published Patient patient;
  @published ConnexionBase connexionBase;

  ProblemeTable.created() : super.created() {}
}
