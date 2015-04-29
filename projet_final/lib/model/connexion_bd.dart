part of systeme_gestion_patient;

class ConnexionBase {
  @observable List<Utilisateur> utilisateurs =
      toObservable(new List<Utilisateur>());
  @observable Utilisateur utilisateurConnecte;
  @observable String message = "Veuillez vous connecter svp.";
  @observable String infoConnexion = 'Ouvrir une session';

  ConnexionBase() {
    ouvrirUneConnexionBd();
  }

  Utilisateur trouverUnUtilisateur(String username, String passeWord) {
    return utilisateurs.firstWhere((Utilisateur u) =>
            ((u.username == username) && (u.password == passeWord)),
        orElse: () => null);
  }

  Utilisateur trouverUnUtilisateurById(String idUtilisateur) {
    return utilisateurs.firstWhere(
        (Utilisateur u) => (u.username == idUtilisateur), orElse: () => null);
  }

  void authentificationConnexion(String username, String password) {
    Utilisateur user = trouverUnUtilisateur(username, password);
    if (user == null) {
      utilisateurConnecte.statutConnexion = false;
      message = "Non d'utilisateur ou mot de passe incorrecte";
    } else {
      message = 'Bienvenu ${user.prenom} ${user.nom}';
      user.statutConnexion = true;
      utilisateurConnecte = user;
      infoConnexion = 'déconnexion';
    }
  }

  EnvoyerDonneVersBase() {
    window.localStorage['projet_final'] = JSON.encode(toJson());
  }

  void order() {
    utilisateurs.sort((m, n) => m.compareTo(n));
  }

  void authentificationDeconnexion() {
    EnvoyerDonneVersBase();
    Utilisateur user = new Utilisateur();
    user.nom = "";
    user.prenom = "";
    user.idPersonne = "";
    user.statutConnexion = false;
    user.profilMedecin = false;
    user.profilAdministrateur = false;
    utilisateurConnecte = user;
    message = 'Veuillez vous connecter svp.';
    infoConnexion = 'Ouvrir une session';
    utilisateurConnecte = user;
  }

  void ouvrirUneConnexionBd() {
    String json = window.localStorage['projet_final'];
    if (json == null) {
      initialiserModel();
    } else {
      fromJson(JSON.decode(json));
      if (utilisateurs.length == 0) {
        initialiserModel();
      }
      order();
    }
  }

  List<Map<String, Object>> toJson() {
    List<Map<String, Object>> entityList = new List<Map<String, Object>>();
    for (Utilisateur utilisateur in utilisateurs) {
      entityList.add(utilisateur.toJson());
    }
    return entityList;
  }

  fromJson(List<Map<String, Object>> entityList) {
    for (Map<String, Object> entityMap in entityList) {
      Utilisateur utilisateur = toObservable(new Utilisateur());
      utilisateur.fromJson(entityMap);
      utilisateurs.add(utilisateur);
    }
  }

  void initialiserModel() {
    Utilisateur utilisateur = toObservable(new Utilisateur());
    utilisateur.nom = "Kouko";
    utilisateur.prenom = "Gildas";
    utilisateur.idPersonne = utilisateur.prenom + utilisateur.nom;
    utilisateur.statutConnexion = false;
    utilisateur.profilAdministrateur = true;
    utilisateur.profilMedecin = true;
    utilisateur.profil = "Administrateur";
    utilisateur.username = "kougil";
    utilisateur.password = "kougil";
    utilisateur.patients = toObservable(utilisateur.patients);

    Patient patient = toObservable(new Patient());
    Patient patient1 = toObservable(new Patient());

    Probleme p = toObservable(new Probleme());
    p.diagnostic = "Sida";
    p.commentaire = "Prendre tous médicaments prescrits au petit déjeuner.";
    p.idProbleme = "prblemetest";

    patient.nom = "Goulet";
    patient.prenom = "Guillaume";
    patient.idPersonne = patient.prenom + patient.nom;
    patient.problemes.internalList =
        toObservable(patient.problemes.internalList);
    patient.problemes.add(p);
    utilisateur.patients.add(patient);

    Probleme p1 = toObservable(new Probleme());
    p1.diagnostic = "Maux de tête chronique";
    p1.commentaire = "Le patient à fait un ACV diabétique il 2 ans.";
    p1.idProbleme = new DateTime.now().toIso8601String();

    patient1.nom = "Maxime";
    patient1.prenom = "Gilbert";
    patient1.idPersonne = patient1.prenom + patient1.nom;
    patient1.problemes.internalList =
        toObservable(patient1.problemes.internalList);
    patient1.problemes.add(p1);
    utilisateur.patients.add(patient1);

    utilisateurs.add(utilisateur);
    authentificationDeconnexion();
  }

  void definirPatientCourant(idPatient) {
    utilisateurConnecte.definirPatientCourant(idPatient);
  }
}
