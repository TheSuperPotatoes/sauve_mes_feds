class ComplementaryExam {
  ComplementaryExam({required this.exams, this.idExam});
  Map<String, dynamic> exams;
  int? idExam;

  ComplementaryExam copyWith({
    Map<String, dynamic>? datas,
  }) {
    return ComplementaryExam(
      exams: datas ?? this.exams,
      idExam: idExam,
    );
  }
}
