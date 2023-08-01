class AnamaneseActuelle {
  AnamaneseActuelle({
    required this.idCase,
    this.symptomePrincipal = "pas spécifié",
    this.localisation = "pas spécifié",
    this.qualite = "pas spécifié",
    this.quantite = "pas spécifié",
    this.irradiation = "pas spécifié",
    this.chronologie = "pas spécifié",
    this.variation = "pas spécifié",
    this.circonstanceDeSurvenue = "pas spécifié",
    this.facteursAttenuants = "pas spécifié",
    this.facteurDeclanchants = "pas spécifié",
  });

  final int idCase;
  final String? symptomePrincipal;
  final String? localisation;
  final String? qualite;
  final String? quantite;
  final String? irradiation;
  final String? chronologie;
  final String? variation;
  final String? circonstanceDeSurvenue;
  final String? facteursAttenuants;
  final String? facteurDeclanchants;

  List<Map<String, dynamic>> get mapDatas {
    return [
      {
        "isDone": false,
        "description": symptomePrincipal,
        "name": "Symptome principal"
      },
      {"isDone": false, "description": localisation, "name": "Localisation"},
      {
        "isDone": false,
        "description": qualite,
        "name": "Qualite",
      },
      {
        "isDone": false,
        "description": quantite,
        "name": "Quantité",
      },
      {
        "isDone": false,
        "description": irradiation,
        "name": "Irradiation",
      },
      {
        "isDone": false,
        "description": chronologie,
        "name": "Chronologie",
      },
      {
        "isDone": false,
        "description": variation,
        "name": "Variation au court du temps",
      },
      {
        "isDone": false,
        "description": circonstanceDeSurvenue,
        "name": "Circonstance de survenue",
      },
      {
        "isDone": false,
        "description": facteursAttenuants,
        "name": "Facteurs atténuants",
      },
      {
        "isDone": false,
        "description": facteurDeclanchants,
        "name": "Facteurs déclanchants",
      },
    ];
  }
}
