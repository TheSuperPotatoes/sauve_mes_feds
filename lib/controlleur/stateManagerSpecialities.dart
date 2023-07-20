import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class SpecialityOSCE {
  const SpecialityOSCE(
      {required this.nameSpectiality,
      required this.descSpectiality,
      this.logo = null});

  final String nameSpectiality;
  final String descSpectiality;
  final int? logo;
}

SpecialityOSCE urgence = const SpecialityOSCE(
    nameSpectiality: "urgence", descSpectiality: "Putain, y a un ECG");
SpecialityOSCE dermatologie = const SpecialityOSCE(
    nameSpectiality: "dermatologie",
    descSpectiality: "1 chance sur 3 que c'est un cancer");
SpecialityOSCE immunologie = const SpecialityOSCE(
    nameSpectiality: "immunologie", descSpectiality: "C'est un lupus");

//StateNotifier: create logic

class SpecialitiesOSCEList extends StateNotifier<List<SpecialityOSCE>> {
  SpecialitiesOSCEList([List<SpecialityOSCE>? initateSpeciality])
      : super(initateSpeciality ?? []);
}

//StateNotiferProvider: init state

final specialityOSCEprovider =
    StateNotifierProvider<SpecialitiesOSCEList, List<SpecialityOSCE>>((ref) {
  return SpecialitiesOSCEList([urgence, dermatologie, immunologie]);
});
