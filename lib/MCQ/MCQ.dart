class MCQ {
  MCQ({
    required this.id,
    required this.category,
    required this.questionContent,
    required this.difficulty,
    required this.answersContent,
    required this.hint,
    required this.answersExplain,
    required this.questionType,
    required this.isFav,
    required this.answer,
    this.labo,
    this.radio,
    this.other,
    required this.sources,
    this.isDoneTime,
  });
  final int id;
  final DateTime? isDoneTime;
  final List<String> answer;
  final List<String> category;
  final String questionContent;
  final int difficulty;
  final Map<String, String?> answersContent;
  final String hint;
  final String answersExplain;
  final String questionType;
  final bool isFav;
  final int? labo;
  final int? radio;
  final int? other;
  final Map<String, String> sources;

  late Map<String, dynamic> mcqData = {
    "category": category,
    "questionContent": questionContent,
    "difficulty": difficulty,
    "answers": {answersContent},
    "hint": hint,
    "answersExplain": answersExplain,
    "questionType": questionType,
    "isFav": false,
    "labo": 0,
    "radio": 0,
    "other": 0,
    "sources": sources,
    "isDoneTime": isDoneTime,
  };

  MCQ copyWith(
      {List<String>? category,
      String? questionContent,
      int? difficulty,
      Map<String, String?>? answers,
      String? answersExplain,
      String? questionType,
      bool? isFav,
      int? labo,
      int? radio,
      int? other,
      int? id,
      Map<String, String>? sources,
      DateTime? isDoneTime}) {
    return MCQ(
      id: id ?? this.id,
      isDoneTime: isDoneTime ?? this.isDoneTime,
      category: category ?? this.category,
      questionContent: questionContent ?? this.questionContent,
      difficulty: difficulty ?? this.difficulty,
      answersContent: answers ?? this.answersContent,
      answer: answer,
      hint: hint,
      answersExplain: answersExplain ?? this.answersExplain,
      questionType: questionType ?? this.questionType,
      isFav: isFav ?? this.isFav,
      labo: labo ?? this.labo,
      radio: radio ?? this.radio,
      other: other ?? this.other,
      sources: sources ?? this.sources,
    );
  }
}
