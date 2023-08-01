class DoctorCase {
  //datas for doctor role
  DoctorCase(
      {required this.caseId,
      required this.speciality,
      this.placeInit =
          "Vous êtes chez la docteresse Julia", //on peut faire une fonction randome,
      this.objectifs = const [
        " Réalise une anamnèse ciblée sur la plainte du patient",
        "Performer un status clinique ciblé selon la plaintes",
        "Evoque un diagnostic différentiel ",
        "Propose un examen paraclinique adéquat"
      ],
      this.complementaryExams,
      this.cardiacFrec = 80,
      this.tension = "120/80",
      this.gsc = 15,
      this.temperature = 36.6,
      required this.intro});
  String speciality;
  String intro;
  String placeInit;
  List<String> objectifs;
  Map<String, dynamic>? complementaryExams;
  int caseId;

  int gsc;
  String tension;
  double temperature;
  int cardiacFrec;
  Map<String, dynamic> get constantes {
    return {
      "Tension": tension,
      "Fréquence cardiaque": cardiacFrec,
      "GSC": gsc,
      "Température": temperature
    };
  }
}
