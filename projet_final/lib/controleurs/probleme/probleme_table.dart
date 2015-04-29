import 'package:polymer/polymer.dart';
import '../../model/systeme_gestion_patient.dart';

@CustomTag('probleme-table')
class ProblemeTable extends PolymerElement {
  @observable @published Patient patient;
  @observable @published ConnexionBase connexionBase;

  ProblemeTable.created() : super.created() {}
}
