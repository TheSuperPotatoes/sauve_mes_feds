import 'package:sauve_mes_feds/index/indexAll.dart';

class PatientOSCE {
  PatientOSCE(
      {required this.idCase,
      required this.spectiality,
      required this.resume,
      this.anamnesePersonelle,
      this.antecedantsPersonels,
      this.exams,
      this.anamaneseActuelle,
      this.status,
      this.management});

  final int idCase;
  final String spectiality;
  final String resume;
  Status? status;
  List<Map<String, dynamic>>? management;
  List<Map<String, dynamic>>? anamnesePersonelle;
  Map<String, List<String>>? antecedantsPersonels;
  List<Map<String, dynamic>>? anamaneseActuelle;
  Map<String, dynamic>? exams;
  String? challenge;

  PatientOSCE copyWith({
    anamnesePersonelle,
    antecedantsPersonels,
    anamaneseActuelle,
    exams,
    status,
    management,
  }) {
    return PatientOSCE(
      idCase: idCase,
      spectiality: spectiality,
      resume: resume,
      exams: exams ?? this.exams,
      anamnesePersonelle: anamnesePersonelle ?? this.anamnesePersonelle,
      antecedantsPersonels: antecedantsPersonels ?? this.antecedantsPersonels,
      anamaneseActuelle: anamaneseActuelle ?? this.anamaneseActuelle,
      status: status ?? this.status,
      management: management ?? this.management,
    );
  }

  late Map<String, dynamic> patientDatas = {
    "anamneseID": idCase, //Mettre un string car sinon ID ne va pas marcher
    "anamnesePersonelle": anamnesePersonelle,
    "anamneseActuelle": anamaneseActuelle,
    "challenge": challenge,
    "speciality": spectiality,
    "resume": resume
  };
}
