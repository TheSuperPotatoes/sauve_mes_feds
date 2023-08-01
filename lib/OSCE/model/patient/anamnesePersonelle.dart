//HABITUDE
class AnamnesePersonelle {
  AnamnesePersonelle(
      {required this.idCase,
      this.medicaments = "Test",
      this.alimentation = "Test",
      this.sport = "Test",
      this.tabac = "Test",
      this.alcool = "Test",
      this.drogue = "Test",
      this.sexualite = "Test",
      this.travail = "Test"});
  final int idCase;
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
      'name': "Médicaments",
      'description': medicaments,
      'isDone': false,
    },
    {
      'name': "Alimentations",
      'description': alimentation,
      'isDone': false,
    },
    {
      'name': "Sport",
      'description': sport,
      'isDone': false,
    },
    {
      'name': "Alcool",
      'description': alcool,
      'isDone': false,
    },
    {
      'name': "Drogue",
      'description': drogue,
      'isDone': false,
    },
    {
      'name': "Tabac",
      'description': tabac,
      'isDone': false,
    },
    {
      'name': "Travail",
      'description': travail,
      'isDone': false,
    },
  ];
}
