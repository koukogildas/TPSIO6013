import 'package:polymer/polymer.dart';

@CustomTag('menu-principal')
class MenuPrincipal extends PolymerElement {
  
/// Liste actio menu principal.
final List<String> menuPrincipal = const [
  "Ajouter un médécin",
  "Ouvrir un dossier",
  ];

  MenuPrincipal.created() : super.created();

}