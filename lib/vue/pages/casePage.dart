import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sauve_mes_feds/controlleur/index.dart';
import '../mainIndex.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class CasesPages extends ConsumerStatefulWidget {
  const CasesPages({super.key, required this.specialityName});
  final String specialityName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CasesPagesState();
}

class _CasesPagesState extends ConsumerState<CasesPages> {
  @override
  // List<CardCase> listSubjects = [];

  // List<CardCase> createDumbList(int n) {
  //   for (var i = 0; i < n; i++) {
  //     listSubjects.add(CardCase());
  //   }
  //   return listSubjects;
  // }

  @override
  void initState() {
    super.initState();
    // listSubjects = createDumbList(12);
  }

  @override
  Widget build(BuildContext context) {
    //filtre la liste selon la spécialité séléctionnée
    var listCases = ref
        .watch(CaseOSCEProvider)
        .where((element) => element.speciality == widget.specialityName)
        .toList();
    print(listCases.length);
    return WillPopScope(
      onWillPop: () {
        context.go("/sujets");
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Cas clinique de ${widget.specialityName}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text("Selectionnez un cas clinique",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            ResearchBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 282,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listCases.length,
                  itemBuilder: (context, index) {
                    return CardCase(caseOSCE: listCases[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
