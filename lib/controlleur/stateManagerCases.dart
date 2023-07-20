import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:sauve_mes_feds/models/index.dart";
import "package:sauve_mes_feds/models/init.dart";

class CaseOSCEList extends StateNotifier<List<CaseOSCE>> {
  CaseOSCEList([List<CaseOSCE>? initateSpeciality])
      : super(initateSpeciality ?? []);
}

final caseOSCEProvider = StateNotifierProvider<CaseOSCEList, List<CaseOSCE>>(
    (ref) => CaseOSCEList([cas1]));
