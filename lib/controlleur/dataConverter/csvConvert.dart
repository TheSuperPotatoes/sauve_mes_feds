//create a reader looking for each item.
//store eachItem in
//for map, iterate in map and genereate newQuestion

import 'dart:io';
import 'package:sauve_mes_feds/index/indexModels.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import "package:path_provider/path_provider.dart";
import "package:csv/csv.dart";

//return extracts xlsx file data
extractQuestions() async {
  var bytes = File("lib/controlleur/dataConverter/DatabaseModels.xlsx")
      .readAsBytesSync();
  var decoder = SpreadsheetDecoder.decodeBytes(bytes);
  var table = decoder.tables['questions'];
  var maxRow = table!.maxRows;
  var rows = table.rows;
  var mapHead = hashRow(rows[0]);
  List<MCQ> listQuestion = [];

  for (var rowNum = 1; rowNum < maxRow; rowNum++) {
    var cell = rows[rowNum];

    MCQ newQuestion = MCQ(
        id: cell[mapHead["idQuestion"]!],
        category: parseList(cell[mapHead["categorie"]!]),
        questionContent: cell[mapHead["question"]!].trim(),
        difficulty: cell[mapHead["difficulty"]!],
        answersContent: {
          "A": cell[mapHead["responseA"]!].trim().toString(),
          "B": cell[mapHead["responseB"]!].trim().toString(),
          "C": cell[mapHead["responseC"]!].trim().toString(),
          "D": cell[mapHead["responseD"]!].trim().toString(),
          if (cell[mapHead["responseE"]!] != null)
            "E": cell[mapHead["responseE"]!]
                .trim()
                .toString(), //last item can be null
        },
        hint: cell[mapHead["hint"]!].trim(),
        answersExplain: cell[mapHead["answersExplain"]!].trim(),
        questionType: cell[mapHead["questionType"]!].trim(),
        isFav: cell[mapHead["isFav"]!],
        answer: parseList(cell[mapHead["answer"]!]),
        sources: parseSource(cell[mapHead["sources"]!]));

    listQuestion.add(newQuestion);
  }
  return listQuestion;
}

Map<String, int> hashRow(List firstRow) {
  Map<String, int> mapHead = {};
  for (var i = 0; i < firstRow.length; i++) {
    mapHead[firstRow[i].toString()] = i;
  }
  return mapHead;
}

//ALL FUNCTION TO PARSE DATA IN CORRECT FORM
Map<String, String> parseSource(String? value) {
  Map<String, String> sources = {};
  if (value != null) {
    List<String> keyValuePairs = value.split(',');

    for (String pair in keyValuePairs) {
      List<String> keyValue = pair.split(':');

      String key = keyValue[0].trim().replaceAll('"', '');
      String value = keyValue[1].trim().replaceAll('"', '');
      sources[key] = "https://$value";
    }
    return sources;
  }
  return {};
}

List<String> parseList(String value) {
  List<String> list = value.split(",");

  list.removeWhere((element) => element.isEmpty);
  list = [for (var item in list) item.trim()];

  return list;
}

bool parseBool(int value) {
  return value == 1 ? true : false;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
