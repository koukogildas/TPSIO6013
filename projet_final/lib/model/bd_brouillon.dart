//part of systeme_gestion_patient;
//
//class ConnexionDb {
//  ConnectionPool pool = null;
//  var requette;
//  var resutlat;
//
//  connexionDb() {
//    ouvrirUneConnexion();
//  }
//
//  void ouvrirUneConnexion() {
//    if (pool == null) {
//      pool = new ConnectionPool(
//          host: 'localhost',
//          port: 3306,
//          user: 'root',
//          password: 'root',
//          db: 'projet',
//          max: 5);
//    }
//  }
//
//  void fermerConnexion() {
//    pool.close();
//  }
//
//  List<Utilisateur> listeUtilisateurs() {
//    requette =
//        "select * from projet.user where type='administrateur' or type= 'medecin'";
//    executrerRequette();
//    return constituerListeUtilisateurs();
//  }
//
//  List<Utilisateur> constituerListeUtilisateurs() {
//    List<Utilisateur> utilisateurs = new List<Utilisateur>();
//    if (resutlat != null) {
//      resutlat.forEach((ligne) {
//        Utilisateur utilisateur = new Utilisateur();
//        utilisateur.nom = ligne.nom;
//        utilisateur.prenom = ligne.prenom;
//        utilisateur.password = ligne.password;
//        utilisateur.username = ligne.username;
//        utilisateurs.add(utilisateur);
//      });
//    }
//    resutlat= null;
//    return utilisateurs;
//  }
//
//  Utilisateur chargerListePatientsUtilisateur(Utilisateur utilisateur) {
//    requette = "select * from projet.user where type='patient'";
//    executrerRequette();
//    utilisateur.patients = constituerListePatient();
//    return utilisateur;
//  }
//  
//  List<Patient> constituerListePatient() {
//    List<Patient> patients = new List<Patient>();
//     if (resutlat != null) {
//       resutlat.forEach((ligne) {
//         Patient patient = new Patient();
//         patient.nom = ligne.nom;
//         patient.prenom = ligne.prenom;
//         patient.nas = ligne.password;
//         patients.add(patient);
//       });
//     }
//     resutlat= null;
//     return patients;
//   }
//
////  Personne selectionnerUnUtilisateur(String idPersonne) {}
////
////  Personne authentifierUnUtilisateur(String username, String password) {}
//
//  void executrerRequette() {
//    resutlat = null;
//    pool.query(requette).then((result) {
//      resutlat = result;
//    });
//  }
//}
