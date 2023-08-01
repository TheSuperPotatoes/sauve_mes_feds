import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:sauve_mes_feds/index/indexAll.dart';
import "package:sauve_mes_feds/controlleur/dataConverter/xlsxConvert.dart";

//Tous les états pour manager la page MCQ
class MCQList extends StateNotifier<List<MCQ>> {
  MCQList([List<MCQ>? initateMCQ]) : super(initateMCQ ?? []);
  late int getLength = state.length;
  void toggleIsFav(int id) {
    if (id >= 0 && id < state.length) {
      // Obtenez la question à l'index spécifié
      var question = state.firstWhere((element) => element.id == id);
      // Créez une nouvelle instance de MCQ avec isFav mis à jour
      MCQ updatedQuestion = question.copyWith(isFav: !question.isFav);
      int index = state.indexOf(question);
      // Mettez à jour la liste avec la nouvelle instance
      state = [...state]..replaceRange(index, index + 1, [updatedQuestion]);
    }
  }

  //Create limited question
  List<MCQ> limitedQuestion(int num) {
    List<MCQ> newList = randomList();
    return newList.take(num).toList();
  }

  List<MCQ> randomList() {
    final newList = [...state];
    newList.shuffle();
    return newList;
  }
}

var providerMCQ = StateNotifierProvider<MCQList, List<dynamic>>((ref) {
  return MCQList([question1]);
});

//tous les états de la page ainsi que ces controlleurs

final pageIndexProvider = StateProvider<int>((ref) => 0);

enum HintState { hint, notHint }

enum ButtonHint { pressed, notPressed }

enum PageState { notAnswered, answeredIsRight, answeredIsFalse }

final hintProvider = StateProvider<HintState>((ref) {
  return HintState.notHint;
});
final buttonProvider = StateProvider<ButtonHint>((ref) {
  return ButtonHint.notPressed;
});
final pageMCQProvider =
    StateProvider<PageState>((ref) => PageState.notAnswered);

class MCQResults extends StateNotifier<List> {
  MCQResults([List<MCQ>? initeList]) : super(initeList ?? []);
}
