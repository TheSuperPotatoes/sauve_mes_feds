class Status {
  Status({
    required this.datas,
    required this.idCase,
    required this.idStatus,
  });

  final Map<String, dynamic> datas;
  final int idStatus;
  final int idCase;

  Status copyWith({
    Map<String, dynamic>? datas,
  }) {
    return Status(
        datas: datas ?? this.datas, idStatus: idStatus, idCase: idCase);
  }
}
