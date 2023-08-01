import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:sauve_mes_feds/statics/initValue.dart";

@immutable
class SpecialityOSCE {
  const SpecialityOSCE(
      {required this.idSpe,
      required this.nameSpectiality,
      required this.descSpeciality,
      this.logo});
  final String idSpe;
  final String nameSpectiality;
  final String descSpeciality;
  final int? logo;
}

List<Map<String, String>> specialities = InitValue.specialitiesOSCE;

List<SpecialityOSCE> specialitieList = specialities
    .map((specialitie) => SpecialityOSCE(
        idSpe: specialitie["idSpe"]!,
        nameSpectiality: specialitie["name"]!,
        descSpeciality: specialitie["description"]!))
    .toList();

//StateNotifier: create logic

class SpecialitiesOSCEList extends StateNotifier<List<SpecialityOSCE>> {
  SpecialitiesOSCEList([List<SpecialityOSCE>? initateSpeciality])
      : super(initateSpeciality ?? []);
}

//StateNotiferProvider: init state

final specialityOSCEprovider =
    StateNotifierProvider<SpecialitiesOSCEList, List<SpecialityOSCE>>((ref) {
  return SpecialitiesOSCEList(specialitieList);
});
