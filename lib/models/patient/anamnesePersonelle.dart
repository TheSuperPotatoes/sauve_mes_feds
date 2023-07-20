//HABITUDE
class AnamnesePersonelle {
  AnamnesePersonelle(
      {this.medicaments = "Test",
      this.alimentation = "Test",
      this.sport = "Test",
      this.tabac = "Test",
      this.alcool = "Test",
      this.drogue = "Test",
      this.sexualite = "Test",
      this.travail = "Test"});

  final String?
      medicaments; //si plus de trois médicaments. Mettre images d'une liste.
  final String? alimentation;
  final String? sport;
  final String? tabac;
  final String? alcool;
  final String? drogue;
  final String? sexualite;
  final String? travail;

  late List<Map<String, dynamic>> dataMap = [
    {
      'Catégorie': "Médicaments",
      'Infos': medicaments,
      'isDone': false,
    },
    {
      'Catégorie': "Alimentations",
      'Infos': alimentation,
      'isDone': false,
    },
    {
      'Catégorie': "Sport",
      'Infos': sport,
      'isDone': false,
    },
    {
      'Catégorie': "Alcool",
      'Infos': alcool,
      'isDone': false,
    },
    {
      'Catégorie': "Drogue",
      'Infos': drogue,
      'isDone': false,
    },
    {
      'Catégorie': "Tabac",
      'Infos': tabac,
      'isDone': false,
    },
    {
      'Catégorie': "Travail",
      'Infos': travail,
      'isDone': false,
    },
  ];
}
