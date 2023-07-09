import "index.dart";

class AnamnesesPart {
  AnamnesesPart(
      {required this.section,
      required this.description,
      this.anamaneseActuelle,
      this.anamneseMedicamenteuse,
      this.anamnesePsychosociale,
      this.anamnesePsychiatrique,
      this.anamneseSexuelle});

  final String section; //si sous catégorie, écrire section/soussecion
  final String description;
  Map<String, String?>? anamaneseActuelle; //Store en AnamaneseActuelle
  List<dynamic>? antecedantsPersonels;
  List<dynamic>? anamneseMedicamenteuse; //si plus de 3 médicaments
  Map<String, String?>? anamneseSexuelle;
  Map<String, String?>? anamnesePsychosociale;
  Map<String, String?>? anamnesePsychiatrique;
}

//map https://github.com/isar/isar/issues/32

class AnamaneseActuelle {
  AnamaneseActuelle({
    this.isDonesymptomePrincipal = false,
    this.isDonelocalisation = false,
    this.isDonequalite = false,
    this.isDonequantite = false,
    this.isDoneirradiation = false,
    this.isDonechronologie = false,
    this.isDonevariationAuCourtDuTemps = false,
    this.isDonecirconstanceDeSurvenue = false,
    this.isDonefacteursAttenuants = false,
    this.isDonefacteurDeclanchants = false,
    this.symptomePrincipal,
    this.localisation,
    this.qualite,
    this.quantite,
    this.irradiation,
    this.chronologie,
    this.variationAuCourtDuTemps,
    this.circonstanceDeSurvenue,
    this.facteursAttenuants,
    this.facteurDeclanchants,
  });
  final String? symptomePrincipal;
  final String? localisation;
  final String? qualite;
  final String? quantite;
  final String? irradiation;
  final String? chronologie;
  final String? variationAuCourtDuTemps;
  final String? circonstanceDeSurvenue;
  final String? facteursAttenuants;
  final String? facteurDeclanchants;

  final bool? isDonesymptomePrincipal;
  final bool? isDonelocalisation;
  final bool? isDonequalite;
  final bool? isDonequantite;
  final bool? isDoneirradiation;
  final bool? isDonechronologie;
  final bool? isDonevariationAuCourtDuTemps;
  final bool? isDonecirconstanceDeSurvenue;
  final bool? isDonefacteursAttenuants;
  final bool? isDonefacteurDeclanchants;
}

//HABITUDE
class AnamnesePersonelle {
  AnamnesePersonelle(
      {this.isDoneAlimentation = false,
      this.isDoneSport = false,
      this.isDoneTabac = false,
      this.isDonealcool = false,
      this.isDonedrogue = false,
      this.isDonesexualite = false,
      this.isDonetravail = false,
      this.medicaments,
      this.alimentation,
      this.sport,
      this.tabac,
      this.alcool,
      this.drogue,
      this.sexualite,
      this.travail});

  final String?
      medicaments; //si plus de trois médicaments. Mettre images d'une liste.
  final String? alimentation;
  final String? sport;
  final String? tabac;
  final String? alcool;
  final String? drogue;
  final String? sexualite;
  final String? travail;

  final bool? isDoneAlimentation;
  final bool? isDoneSport;
  final bool? isDoneTabac;
  final bool? isDonealcool;
  final bool? isDonedrogue;
  final bool? isDonesexualite;
  final bool? isDonetravail;
}

final anamnesePersonelle1 = AnamnesePersonelle(
    //Faire une map!
    medicaments: "Pillules",
    alimentation: "Équilibrée",
    sport: "Course",
    tabac: "1 paquet par jour",
    alcool: "1x par semaine",
    drogue: "Aucune",
    sexualite: "Hétéro. 1x par jour");

//TEMPLATE
Map<String, String?> anamnesePersonelle = {
  "Médicament": anamnesePersonelle1.medicaments,
  "Alimentation": anamnesePersonelle1.alimentation,
  "Sport": anamnesePersonelle1.sport,
  "Alcool": anamnesePersonelle1.alcool,
  "Drogue": anamnesePersonelle1.drogue,
  "Séxualité": anamnesePersonelle1.sexualite,
  "Tabac": anamnesePersonelle1.tabac,
  "Travail": anamnesePersonelle1.travail,
};

final anamaneseActuelle = AnamaneseActuelle(
    symptomePrincipal: "Douleur lombaire",
    localisation: "A droite",
    qualite: "7/10",
    quantite: null,
    irradiation: "Fosse droite",
    chronologie: "depuis deux jours",
    variationAuCourtDuTemps: "constant",
    circonstanceDeSurvenue: null,
    facteursAttenuants: "Après dafalgan",
    facteurDeclanchants: "au mouvement");

Map<String, String?> anamaneseActuelleMap = {
  "Symptome principal": anamaneseActuelle.symptomePrincipal,
  "Localisation": anamaneseActuelle.localisation,
  "Qualite": anamaneseActuelle.quantite,
  "Quantité": anamaneseActuelle.qualite!,
  "Irradiation": anamaneseActuelle.irradiation!,
  "Chronologie": anamaneseActuelle.chronologie!,
  "Variation au court du temps": anamaneseActuelle.variationAuCourtDuTemps,
  "Circonstance de survenue": anamaneseActuelle.circonstanceDeSurvenue,
  "Facteurs atténuants": anamaneseActuelle.facteursAttenuants,
  "Facteurs déclanchants": anamaneseActuelle.facteurDeclanchants,
};

final anamneseActuelle = AnamnesesPart(
    description: "On va mettre une liste",
    section: "Anamnèse actuelle",
    anamaneseActuelle: anamaneseActuelleMap);

final antecedantsPersonels = AnamnesesPart(
    description: "Bonne santé habituelle", section: "Antécédents personels");

final anamneseMedicamenteuse = AnamnesesPart(
    description: "Pillule et des anxiolytiques",
    section: "Antécédents médicamenteux");

final anamneseSexuelle = AnamnesesPart(
    section: "Anamanèse sexuelle",
    description: "Activité sexuelle non à risque");

//Crér un map converter

// void main() {
//   Anamnese anamneseActuelle = Anamnese("Maux de tête");

//   Map<String, String> symptomesMap = {
//     "Symptome principal": () => anamneseActuelle.symptomePrincipal,
//     // Autres clés et valeurs...
//   };

//   // Accéder à la valeur de la clé "Symptome principal"
//   String symptomePrincipal = symptomesMap["Symptome principal"]();

//   print("Symptome principal: $symptomePrincipal");
// }
