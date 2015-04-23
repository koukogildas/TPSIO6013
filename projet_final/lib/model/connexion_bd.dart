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
//  Personnes listeUtilisateurs() {
//    requette =
//        "select * from projet.user where type='administrateur' or type= 'medecin'";
//    executrerRequette();
//    return constituerListePersonne();
//  }
//
//  Personnes constituerListePersonne() {
//    if (resutlat != null) {
//      Personnes personnes = new Personnes();
//      resutlat.forEach((ligne) {
//        Personne personne = new Personne();
//        personne.nom = ligne.nom;
//        personne.prenom = ligne.prenom;
//        personne.password = ligne.password;
//        personne.username = ligne.username;
//        personnes.add(personne);
//      });
//      resutlat= null;
//      return personnes;
//    }
//
//    return null;
//  }
//
//  Personnes listePatients() {
//    requette = "select * from projet.user where type='patient'";
//    executrerRequette();
//    return constituerListePersonne();
//  }
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
