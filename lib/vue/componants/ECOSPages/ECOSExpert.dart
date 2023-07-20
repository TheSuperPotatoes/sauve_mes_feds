import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sauve_mes_feds/models/patient/management.dart';

import 'package:sauve_mes_feds/vue/componants/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sauve_mes_feds/controlleur/index.dart';
import "package:sauve_mes_feds/models/init.dart";
import "package:sauve_mes_feds/models/index.dart";

class ExpertView extends StatelessWidget {
  ExpertView({super.key, required this.caseOSCE});
  CaseOSCE caseOSCE;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Timer(),
        Situation(resume: caseOSCE.resume),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Text("Anamnèse",
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        AnamneseSection(),
        Status(),
        compleExam(),
        ManagementWidget(),
      ],
    ));
  }
}

class AnamneseSection extends ConsumerWidget {
  const AnamneseSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SecondeHeadline(head: "Anamnese actuelle"),
        AnamneseSecItems(
            listMap: anamneseActuelleMap.mapDatas, type: "ACTUELLE"),
        SecondeHeadline(head: "Anamnese personelle"),
        AnamneseSecItems(listMap: anamnesePersonelleMap, type: "PERSONELLE"),
      ],
    );
  }
}

class SecondeHeadline extends StatelessWidget {
  SecondeHeadline({super.key, required this.head});
  String head;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(head, style: Theme.of(context).textTheme.headlineSmall),
        Container(
          padding: EdgeInsets.all(5),
          child: Text("[notDone/done]",
              style: Theme.of(context).textTheme.bodySmall),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
  }
}

class AnamneseSecItems extends ConsumerStatefulWidget {
  AnamneseSecItems({super.key, required this.listMap, required this.type});
  late List<Map<String, dynamic>> listMap;
  String type;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnamneseSecItemsState();
}

class _AnamneseSecItemsState extends ConsumerState<AnamneseSecItems> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listMap = widget.listMap;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: listMap.length, // a refaire
      itemBuilder: (context, index) {
        final mapItem = listMap[index];
        var patientData = ref.watch(patientProvider);
        var patientNotifier = ref.watch(patientProvider.notifier);
        bool isDone = patientNotifier.getIsDoneAnamnese(index, widget.type);

        var textStyleisDone = const TextStyle(
            decoration: TextDecoration.lineThrough, // Spécifie le style barré
            decorationColor:
                Colors.black, // Couleur du trait barré (facultatif)
            decorationThickness: 2.0,
            color: Colors.grey // Épaisseur du trait barré (facultatif)
            );
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(minHeight: 30),
                    onPressed: () {
                      setState(() {
                        switch (widget.type) {
                          case "ACTUELLE":
                            patientNotifier.toggleIsDone(
                                patientData.anamaneseActuelle,
                                index,
                                "anamaneseActuelle");
                          case "PERSONELLE":
                            patientNotifier.toggleIsDone(
                                patientData.anamnesePersonelle,
                                index,
                                "anamnesePersonelle");
                        }
                      });
                    },
                    icon: isDone
                        ? Icon(Icons.check_box)
                        : Icon(Icons.check_box_outline_blank)),
                isDone
                    ? Text(
                        mapItem["Catégorie"],
                        style: textStyleisDone,
                      )
                    : Text(mapItem["Catégorie"],
                        style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
            isDone
                ? Text(
                    mapItem["Infos"],
                    style: textStyleisDone,
                  )
                : Text(mapItem["Infos"])
          ],
        );
      },
    );
  }
}

class Status extends ConsumerStatefulWidget {
  const Status({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StatusState();
}

class _StatusState extends ConsumerState<Status> {
  Widget build(BuildContext context) {
    var statusProvider = ref.watch(patientProvider);
    var statusData = statusProvider.status!.datas;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text("Status", style: Theme.of(context).textTheme.headlineMedium),
        for (var systemKey in statusData.keys)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SecondeHeadline(
                head: systemKey.toString(),
              ),
              ListItemExpertStatus(
                mapList: statusData[systemKey]["signes"],
                keyValue: systemKey,
              )
            ],
          )
      ],
    );
  }
}

class compleExam extends ConsumerStatefulWidget {
  const compleExam({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _compleExamState();
}

class _compleExamState extends ConsumerState<compleExam> {
  @override
  Widget build(BuildContext context) {
    var patientData = ref.watch(patientProvider);
    var items = patientData.exams!["images"];
    var mapValue = ref.watch(patientProvider).exams!["images"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Text("Examens complémentaires",
            style: Theme.of(context).textTheme.headlineMedium),
        for (var i = 0; i < items.length; i++)
          Row(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minHeight: 30),
                  onPressed: () {
                    setState(() {
                      ref.watch(patientProvider.notifier).toogleIsDoneExams(i);
                    });
                  },
                  icon: mapValue[i]["isDone"]
                      ? Icon(Icons.check_box)
                      : Icon(Icons.check_box_outline_blank)),
              Text(items[i]["name"])
            ],
          )
      ],
    );
  }
}

class ManagementWidget extends ConsumerStatefulWidget {
  const ManagementWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MangamentState();
}

class _MangamentState extends ConsumerState<ManagementWidget> {
  @override
  Widget build(BuildContext context) {
    var patientData = ref.watch(patientProvider);
    var managementDatas = patientData.management!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("Management", style: Theme.of(context).textTheme.headlineMedium),

          //ça va être horrible, désolé pour la lisibilité
        ]),
        for (var i = 0; i < managementDatas.length; i++)
          Row(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minHeight: 30),
                  onPressed: () {
                    setState(() {
                      ref
                          .watch(patientProvider.notifier)
                          .toogleIsDoneManagement(i);
                    });
                  },
                  icon: managementDatas[i]["isDone"]
                      ? Icon(Icons.check_box)
                      : Icon(Icons.check_box_outline_blank)),
              Expanded(
                child: Text(
                  managementDatas[i]["name"],
                  softWrap: true,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
      ],
    );
    ;
  }
}

class ListItemExpertStatus extends ConsumerStatefulWidget {
  ListItemExpertStatus({
    super.key,
    required this.mapList,
    required this.keyValue,
  });
  List<Map<String, dynamic>> mapList;
  String keyValue;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListItemExpertState();
}

class _ListItemExpertState extends ConsumerState<ListItemExpertStatus> {
  void toggleIsDone({int? index, required String systemKey}) {
    ref.watch(patientProvider.notifier).toogleIsDoneStatus(index!, systemKey);
  }

  @override
  Widget build(BuildContext context) {
    var mapList = widget.mapList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: mapList.length, // statusData[systemKey]["signes"]
          itemBuilder: (context, index) {
            final mapItem = mapList[index]; //l'items
            bool isDone = mapItem["isDone"];
            const textStyleDone = const TextStyle(
                decoration:
                    TextDecoration.lineThrough, // Spécifie le style barré
                decorationColor:
                    Colors.black, // Couleur du trait barré (facultatif)
                decorationThickness: 2.0,
                color: Colors.grey // Épaisseur du trait barré (facultatif)
                );
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(minHeight: 30),
                        onPressed: () {
                          setState(() {
                            toggleIsDone(
                                systemKey: widget.keyValue, index: index);
                          });
                        },
                        icon: isDone
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank)),
                    isDone
                        ? Text(
                            mapItem["name"],
                            style: textStyleDone,
                          )
                        : Text(
                            mapItem["name"],
                            style: Theme.of(context).textTheme.bodySmall,
                          ) //name)
                  ],
                ),
                isDone
                    ? Expanded(
                        child: Text(
                          mapItem["description"], //description,
                          style: textStyleDone,
                          softWrap: true,
                          textAlign: TextAlign.right,
                        ),
                      )
                    : Expanded(
                        child: Text(
                          mapItem["description"],
                          softWrap: true,
                          textAlign: TextAlign.right,
                        ),
                      )
              ],
            );
          },
        ),
      ],
    );
  }
}
