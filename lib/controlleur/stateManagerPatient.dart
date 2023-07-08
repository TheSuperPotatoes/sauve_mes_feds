import 'index.dart';

class PatientOSCE {
  PatientOSCE(
      {required this.idCase,
      required this.spectiality,
      required this.resume,
      required this.anamnese});
  final int idCase;
  final String spectiality;
  final String resume;
  final List<AnamneseSection> anamnese;
  String? challenge;
}

PatientOSCE patientUrgence = PatientOSCE(
    idCase: 1,
    spectiality: "urgence",
    anamnese: [
      anamnesePersonelle,
      antecedantsMedicamenteuse,
      antecedantsPersonels
    ],
    resume:
        "Vous êtes Mme Jane Doe, une femme de 42 ans qui se présente à la clinique avec des douleurs lombaires et de la fièvre. Vous présentez ces symptômes depuis deux jours. La douleur est localisée au flanc droit et est associée à des mictions fréquentes et douloureuses. Vous n'avez pas d'antécédents médicaux significatifs.");
