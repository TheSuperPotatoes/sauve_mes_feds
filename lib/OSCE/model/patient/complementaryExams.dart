class ComplementaryExam {
  ComplementaryExam({required this.exams, this.idExam, required this.idCase});
  Map<String, dynamic> exams;
  int? idExam;
  int idCase;

  ComplementaryExam copyWith({
    Map<String, dynamic>? datas,
  }) {
    return ComplementaryExam(
      exams: datas ?? exams,
      idExam: idExam,
      idCase: idCase,
    );
  }
}
