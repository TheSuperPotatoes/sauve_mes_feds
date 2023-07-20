class AnamaneseActuelle {
  AnamaneseActuelle({
    this.symptomePrincipal = "pas spécifié",
    this.localisation = "pas spécifié",
    this.qualite = "pas spécifié",
    this.quantite = "pas spécifié",
    this.irradiation = "pas spécifié",
    this.chronologie = "pas spécifié",
    this.variationAuCourtDuTemps = "pas spécifié",
    this.circonstanceDeSurvenue = "pas spécifié",
    this.facteursAttenuants = "pas spécifié",
    this.facteurDeclanchants = "pas spécifié",
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

  List<Map<String, dynamic>> get mapDatas {
    return [
      {
        "isDone": false,
        "Infos": symptomePrincipal,
        "Catégorie": "Symptome principal"
      },
      {"isDone": false, "Infos": localisation, "Catégorie": "Localisation"},
      {
        "isDone": false,
        "Infos": qualite,
        "Catégorie": "Qualite",
      },
      {
        "isDone": false,
        "Infos": quantite,
        "Catégorie": "Quantité",
      },
      {
        "isDone": false,
        "Infos": irradiation,
        "Catégorie": "Irradiation",
      },
      {
        "isDone": false,
        "Infos": chronologie,
        "Catégorie": "Chronologie",
      },
      {
        "isDone": false,
        "Infos": variationAuCourtDuTemps,
        "Catégorie": "Variation au court du temps",
      },
      {
        "isDone": false,
        "Infos": circonstanceDeSurvenue,
        "Catégorie": "Circonstance de survenue",
      },
      {
        "isDone": false,
        "Infos": facteursAttenuants,
        "Catégorie": "Facteurs atténuants",
      },
      {
        "isDone": false,
        "Infos": facteurDeclanchants,
        "Catégorie": "Facteurs déclanchants",
      },
    ];
  }
}
