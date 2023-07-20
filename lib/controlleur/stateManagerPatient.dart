import 'package:riverpod/riverpod.dart';
import "package:sauve_mes_feds/models/index.dart";
import 'package:sauve_mes_feds/models/init.dart';

final patientProvider = StateNotifierProvider<PatientOSCEDatas, PatientOSCE>(
    (ref) => PatientOSCEDatas(patientUrgence1));

class PatientOSCEDatas extends StateNotifier<PatientOSCE> {
  PatientOSCEDatas(PatientOSCE patient) : super(patientUrgence1);

  int get incompleteElements {
    return state.anamaneseActuelle!
        .where((element) => element["isDone"] == false)
        .length;
  }

  bool getIsDoneAnamnese(int index, String categorie) {
    switch (categorie) {
      case "ACTUELLE":
        return state.anamaneseActuelle![index]["isDone"];
      case "PERSONELLE":
        return state.anamnesePersonelle![index]["isDone"];
      default:
        return false;
    }
  }

  bool getIsDoneStatus(int index, String categorie) {
    var isDone = state.status!.datas[categorie]["signes"][index]["isDone"];
    print(isDone);
    return isDone;
  }

  void toggleIsDone(
      List<Map<String, dynamic>>? mapData, int index, String field) {
    bool currentValue = mapData![index]["isDone"];
    var updatedMapData = List<Map<String, dynamic>>.from(mapData);
    bool updatedValue = !currentValue;
    updatedMapData[index]["isDone"] = updatedValue;

    switch (field) {
      case "anamneseActuelle":
        state.copyWith(anamaneseActuelle: updatedMapData);
        break;
      case "anamnesePersonelle":
        state.copyWith(anamnesePersonelle: updatedMapData);
      case "status":
        state.copyWith(status: updatedMapData);
    }
  }

  //Exams______
  void toogleIsDoneExams(int index) {
    var currentIsDoneStatus = state.exams!["images"][index]["isDone"];
    var mapDatas = state.exams!;
    var updatedMapDatas = {...mapDatas};
    updatedMapDatas["images"][index]["isDone"] = !currentIsDoneStatus;
    state.copyWith(exams: updatedMapDatas);
    print("$index a été changé en $currentIsDoneStatus");
  }

  //_____________Management____________________

  void toogleIsDoneManagement(int index) {
    var currentIsDoneStatus = state.management![index]["isDone"];
    var mapDatas = state.management!;
    var updatedMapDatas = [...mapDatas];
    updatedMapDatas[index]["isDone"] = !currentIsDoneStatus;
    state.copyWith(management: updatedMapDatas);
    print("$index a été changé en $currentIsDoneStatus");
  }

  //_______Status___________-

  void toogleIsDoneStatus(int index, String categorie) {
    var currentIsDoneStatus =
        state.status!.datas[categorie]["signes"][index]["isDone"];
    var mapDatas = state.status!.datas;
    var updatedMapDatas = {...mapDatas};
    bool updateValue = !currentIsDoneStatus;

    // Créez une copie du dictionnaire existant
    updatedMapDatas[categorie]["signes"][index]["isDone"] = updateValue;
    state.status!.copyWith(datas: updatedMapDatas);
    print("$index $categorie a été changé en $updateValue");
  }
}
