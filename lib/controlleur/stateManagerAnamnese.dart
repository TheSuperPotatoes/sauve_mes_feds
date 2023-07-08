import "index.dart";

class AnamneseSection {
  AnamneseSection({required this.section, required this.description});
  final String section; //si sous catégorie, écrire section/soussecion
  final String description;
  List<AnamaneseItems>? anamaneseItems;
}

final anamnesePersonelle = AnamneseSection(
    description:
        "Vous présentez ces symptômes depuis deux jours. La douleur est localisée au flanc droit et est associée à des mictions fréquentes et douloureuses. Vous avez vomis 2x. Vous avez pris 1 dafalgan 1 gramme",
    section: "anamneseActuelle");

final antecedantsPersonels = AnamneseSection(
    description: "Appandicectomie il y 10 ans. Fracture du tibia il y 3 ans",
    section: "antecedantsPersonels");

final antecedantsMedicamenteuse = AnamneseSection(
    description: "Pillule", section: "antecedantsMedicamenteuse");

class AnamaneseItems {}
