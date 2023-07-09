import 'index.dart';

class PatientOSCE {
  PatientOSCE(
      {required this.idCase,
      required this.spectiality,
      required this.resume,
      required this.anamneses,
      required this.habitude,
      this.infosPersonel});
  final String? infosPersonel;
  final int idCase;
  final String spectiality;
  final String resume;
  final List<AnamnesesPart> anamneses;
  final AnamnesePersonelle habitude;
  String? challenge;
}

PatientOSCE patientUrgence1 = PatientOSCE(
    idCase: 1,
    spectiality: "urgence",
    anamneses: [
      anamneseActuelle,
      antecedantsPersonels,
      anamneseMedicamenteuse,
    ],
    habitude: anamnesePersonelle1,
    resume:
        "Vous êtes Mme Jane Doe, une femme de 42 ans qui se présente à la clinique avec des douleurs lombaires et de la fièvre. Vous présentez ces symptômes depuis deux jours. La douleur est localisée au flanc droit et est associée à des mictions fréquentes et douloureuses et de la fièvre. Vous n'avez pas d'antécédents médicaux significatifs.");
