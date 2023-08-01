import 'package:flutter/material.dart';
import 'package:sauve_mes_feds/MCQ/stateManagerMCQPage.dart';
import 'controlleur/dataConverter/xlsxConvert.dart';
import 'index/indexVue.dart';
import 'dart:io';
import "package:path_provider/path_provider.dart";
import "controlleur/router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var listQuestion = await extractQuestions();
  runApp(ProviderScope(
      overrides: [providerMCQ.overrideWith((ref) => MCQList(listQuestion))],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: mainTheme,
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<List<FileSystemEntity>> readDirectoryContents() async {
  // Obtenir le chemin d'accès local
  String localPath = await _localPath;

  // Ouvrir le répertoire
  Directory directory = Directory("$localPath/flutter_assets");

  // Vérifier si le répertoire existe
  if (await directory.exists()) {
    // Lire le contenu du répertoire
    List<FileSystemEntity> contents = await directory.list().toList();

    return contents;
  } else {
    // Le répertoire n'existe pas
    throw FileSystemException('Directory not found');
  }
}
