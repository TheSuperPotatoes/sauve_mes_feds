import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sauve_mes_feds/controlleur/stateManagerSpecialities.dart';
import "index.dart";

@immutable
class CaseOSCE {
  CaseOSCE(
      {required this.speciality,
      required this.nameCas,
      required this.resume,
      this.isExpert = false,
      this.isDocteur = false,
      this.isPatient = false,
      this.isFav = false,
      required this.id});

  late int? id;
  String speciality;
  final String nameCas;
  final String resume;
  final bool isExpert;
  final bool isDocteur;
  final bool isPatient;
  final bool isFav;
  late DateTime? dateDone;
}

CaseOSCE cas1 = CaseOSCE(
  speciality: "urgence",
  id: 1,
  nameCas: "Une douleure au thorax",
  resume: "Patient/e de 55 ans avec des douleurs thoraciques",
  isExpert: true,
  isDocteur: true,
  isPatient: true,
  isFav: false,
);

CaseOSCE cas4 = CaseOSCE(
  id: 2,
  speciality: "urgence",
  nameCas: "Migraine",
  resume: "Patient/e de 55 ans avec des migraines ",
  isExpert: true,
  isDocteur: true,
  isPatient: false,
  isFav: false,
);

CaseOSCE cas2 = CaseOSCE(
  id: 3,
  speciality: "dermatologie",
  nameCas: "Une grosse plaque",
  resume: "J'ai une grosse plaque",
  isExpert: true,
  isDocteur: false,
  isPatient: false,
  isFav: true,
);

CaseOSCE cas3 = CaseOSCE(
  id: 4,
  speciality: "immunologie",
  nameCas: "J'ai de l'urticaire",
  resume: "ça gratte",
  isExpert: true,
  isDocteur: true,
  isPatient: false,
  isFav: false,
);

class CaseOSCEList extends StateNotifier<List<CaseOSCE>> {
  CaseOSCEList([List<CaseOSCE>? initateSpeciality])
      : super(initateSpeciality ?? []);

  //TO DO implemants CRUD logic here
}

final CaseOSCEProvider = StateNotifierProvider<CaseOSCEList, List<CaseOSCE>>(
    (ref) => CaseOSCEList([cas1, cas2, cas3, cas4]));
