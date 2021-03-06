import 'package:polymer/polymer.dart';
//import 'package:projet_final/model/systeme_gestion_patient.dart';
import '../../../model/systeme_gestion_patient.dart';

@CustomTag('patient-table')
class PatientTable extends PolymerElement {
  @published ConnexionBase connexionBase;
  @observable Patient patient;

  PatientTable.created() : super.created() {}
}
