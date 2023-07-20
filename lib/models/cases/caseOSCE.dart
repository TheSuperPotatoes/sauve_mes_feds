import 'package:flutter/material.dart';
import "package:sauve_mes_feds/models/role/patientOSCE.dart";

@immutable
class CaseOSCE {
  CaseOSCE(
      {required this.speciality,
      required this.nameCas,
      required this.resume,
      this.patientOSCE,
      this.isExpert = false,
      this.isDocteur = false,
      this.isPatient = false,
      this.isFav = false,
      required this.id});

  late int? id;
  String speciality;
  PatientOSCE? patientOSCE;
  final String nameCas;
  final String resume;
  final bool isExpert;
  final bool isDocteur;
  final bool isPatient;
  final bool isFav;
  late DateTime? dateDone;
}
