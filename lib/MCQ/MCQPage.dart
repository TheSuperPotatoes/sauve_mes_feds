import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sauve_mes_feds/MCQ/stateManagerMCQPage.dart';
import 'package:sauve_mes_feds/index/indexModels.dart';
import 'package:url_launcher/url_launcher.dart';

class MCQPage extends ConsumerStatefulWidget {
  const MCQPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MCQStatePage();
}

class MCQStatePage extends ConsumerState<MCQPage> {
  late List<MCQ> listQuestion;
  @override
  void initState() {
    super.initState();
    var notifierMCQ = ref.read(providerMCQ.notifier);

    listQuestion = notifierMCQ.limitedQuestion(15); // Doesn't throw error
  }

  void reset() {
    ref.watch(pageIndexProvider.notifier).update((state) => state = 0);
    listQuestion = ref.read(providerMCQ.notifier).limitedQuestion(15);
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = ref.watch(pageIndexProvider);
    var currentQuestionData = listQuestion[currentIndex];
    //main page
    return WillPopScope(
      onWillPop: () async {
        // Code à exécuter lorsque le bouton "Retour" est appuyé
        // Retourne true si pour autoriser sinon false pour l'empêcher

        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Êtes-vous sûr de vouloir quitter ?',
                  style: Theme.of(context).textTheme.bodyMedium),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Non',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: Text('Oui',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    context.go('/');
                    reset();
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 100, 25, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Header(
                  listQuestion: listQuestion,
                  currentIndex: currentIndex,
                ),
                QuestionContent(currentQuestionData: currentQuestionData),
                HintQuestion(currentQuestionData: currentQuestionData),
                AnswersCard(
                  listQuestions: listQuestion,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends ConsumerStatefulWidget {
  Header({super.key, required this.listQuestion, required this.currentIndex});
  List<MCQ> listQuestion;
  int currentIndex;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = widget.currentIndex;
    var lastIndex = widget.listQuestion.length - 1;
    var notifierMCQ = ref.watch(providerMCQ.notifier);
    var questionData = widget.listQuestion[currentIndex];

    void reset() {
      ref.watch(hintProvider.notifier).state = HintState.notHint;
      ref.watch(buttonProvider.notifier).state = ButtonHint.notPressed;
      ref.watch(pageMCQProvider.notifier).state = PageState.notAnswered;
    }

    void nextPage() {
      ref.watch(pageIndexProvider.notifier).update((state) => state + 1);
      reset();
    }

    void previousPage() {
      ref.watch(pageIndexProvider.notifier).update((state) => state - 1);
      reset();
    }

    return Column(
      children: [
        Text("[categorie]", style: Theme.of(context).textTheme.headlineMedium),
        //Row button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    currentIndex > 0 ? previousPage() : null;
                  });
                },
                icon: Icon(Icons.arrow_left,
                    color: currentIndex > 0
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.secondary)),
            Text(
              "Question ${currentIndex + 1}/${lastIndex + 1}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  notifierMCQ.toggleIsFav(questionData.id);
                });
              },
              icon: Icon(
                  questionData.isFav ? Icons.star : Icons.star_border_outlined),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  currentIndex < lastIndex ? nextPage() : null;
                });
              },
              icon: Icon(Icons.arrow_right,
                  color: currentIndex < lastIndex
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ],
    );
  }
}

class QuestionContent extends ConsumerStatefulWidget {
  QuestionContent({super.key, required this.currentQuestionData});
  MCQ currentQuestionData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionContentState();
}

class _QuestionContentState extends ConsumerState<QuestionContent> {
  @override
  Widget build(BuildContext context) {
    MCQ currentQuestionData = widget.currentQuestionData;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 170),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text("Question de type ${currentQuestionData.questionType}",
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  currentQuestionData.questionContent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HintQuestion extends ConsumerStatefulWidget {
  HintQuestion({super.key, required this.currentQuestionData});
  MCQ currentQuestionData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HintQuestionState();
}

class _HintQuestionState extends ConsumerState<HintQuestion> {
  //rajouter explication!

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var questionData = widget.currentQuestionData;
    var isHide = ref.watch(hintProvider);
    var isPressed = ref.watch(buttonProvider);
    var isAnswered = ref.watch(pageMCQProvider);

    String hintText = questionData.hint;
    String answersExplain = questionData.answersExplain;
    Map<String, String> sources = questionData.sources;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            isAnswered != PageState.notAnswered
                //explained
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explication",
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text(answersExplain),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var source in sources.entries.toList())
                            TextButton(
                                onPressed: () {
                                  final Uri url = Uri.parse(source.value);
                                  _launchUrl(url);
                                },
                                child: Text("Source: ${source.key}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall))
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      Text("Besoin d'aide?",
                          style: Theme.of(context).textTheme.labelLarge),
                      GestureDetector(
                          onTap: isPressed ==
                                  ButtonHint
                                      .notPressed // Utilisation du booléen pour activer/désactiver le bouton
                              ? () {
                                  setState(() {
                                    ref.watch(hintProvider.notifier).state =
                                        HintState.hint;
                                    debugPrint(isHide.toString());
                                    ref.watch(buttonProvider.notifier).state =
                                        ButtonHint.pressed;
                                  });
                                }
                              : null, // Le bouton est désactivé lorsque isButtonEnabled est false
                          child: Text(
                            isHide == HintState.notHint
                                ? " Cliquez ici pour révéler une réponse"
                                : hintText,
                            softWrap: true,
                            style: Theme.of(context).textTheme.labelMedium,
                          ))
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class AnswersCard extends ConsumerStatefulWidget {
  AnswersCard(
      {super.key, required this.listQuestions, required this.currentIndex});
  List<MCQ> listQuestions;
  int currentIndex;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnswersParts();
}

class _AnswersParts extends ConsumerState<AnswersCard> {
  var slctCardId = 0;
  @override
  Widget build(BuildContext context) {
    List<MCQ> currentSet = widget.listQuestions;
    var currentIndex = widget.currentIndex;
    var currentQuestion = currentSet[currentIndex];
    var currentAnswersContent = currentQuestion.answersContent.entries.toList();
    var isAnswered = ref.watch(pageMCQProvider);

    void tapFunction(String letter, List<String> answer, int id) {
      debugPrint(id.toString());
      slctCardId = id;
      if (answer.contains(letter)) {
        ref.watch(pageMCQProvider.notifier).state = PageState.answeredIsRight;
      } else {
        ref.watch(pageMCQProvider.notifier).state = PageState.answeredIsFalse;
      }
      ;
    }

    //intéressant pour faire les cas!
    Widget isRight;
    switch (isAnswered) {
      case PageState.notAnswered:
        isRight = Text("");
        break;
      case PageState.answeredIsFalse:
        isRight = Text("Mauvaise réponse. Dommage :<",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontFamily: "Outfit",
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ));

        break;
      case PageState.answeredIsRight:
        isRight = Text("Bonne réponse! Vos cours ont servis à quelque chose");
        break;
    }

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Attention, il y a ${currentAnswersContent.length} propositions",
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        isRight, //display vrai/faux

        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: currentAnswersContent.length,
          itemBuilder: (context, index) {
            var letter = currentAnswersContent[index].key;
            var answerContent = currentAnswersContent[index].value;

            bool isChosenIndex(id) {
              return id == slctCardId;
            }

            return isAnswered != PageState.notAnswered
                ? currentSet[currentIndex].answer.contains(letter)
                    ? AnswerCard(
                        letter: letter,
                        answerContent: answerContent,
                        color: Colors.green,
                        slctd: isChosenIndex(index),
                      )
                    : AnswerCard(
                        letter: letter,
                        answerContent: answerContent,
                        color: Theme.of(context).colorScheme.error,
                        slctd: isChosenIndex(index))
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        tapFunction(letter, currentQuestion.answer, index);
                      });
                    },
                    child: AnswerCard(
                      letter: letter,
                      answerContent: answerContent,
                      color: Theme.of(context).colorScheme.tertiary,
                      slctd: false,
                    ));
          },
        ),
      ],
    );
  }
}

class AnswerCard extends StatelessWidget {
  AnswerCard(
      {super.key,
      required this.letter,
      required this.answerContent,
      required this.color,
      this.slctd});
  Color color;
  bool? slctd;
  String letter;
  String? answerContent;

  @override
  Widget build(BuildContext context) {
    return answerContent == null
        ? Container()
        : ConstrainedBox(
            constraints: BoxConstraints(minHeight: 40),
            child: Container(
              decoration: slctd!
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).colorScheme.secondary,
                      ))
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(slctd! ? "Votre réponse" : ""),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Text(letter,
                            style: TextStyle(
                                color: color,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w800)),
                      ),
                      Expanded(
                          child: Text(
                        answerContent!,
                        softWrap: true,
                        style: TextStyle(
                            color: color,
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w300),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
