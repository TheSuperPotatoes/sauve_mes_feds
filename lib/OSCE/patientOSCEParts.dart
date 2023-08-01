import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sauve_mes_feds/index/indexAll.dart';

class PatientView extends StatelessWidget {
  PatientView({super.key, required this.caseOSCE});
  CaseOSCE caseOSCE;

  @override
  Widget build(BuildContext context) {
    PatientOSCE patientOSCE = caseOSCE.patientOSCE!;

    var mapAnamneseActuelle = patientOSCE.anamaneseActuelle!;
    var mapAnamnesePersonelle = patientOSCE.anamnesePersonelle!;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Situation(resume: patientOSCE.resume),
          Consumer(
            builder: (context, ref, child) {
              var timer = ref.watch(timerProvider);
              var temps = DateFormat.ms()
                  .format(DateTime(0, 0, 0, 0, 0, timer.timeLeft))
                  .toString();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Il reste: $temps",
                    style: Theme.of(context).textTheme.bodyLarge),
              );
            },
          ),
          Text("Anamnèse", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(
            height: 10,
          ),
          //Anamnese
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnamneseParts(
                  anamneseSectionTitle: "Anamanese actuelle",
                  mapAnamneseMapData: mapAnamneseActuelle),
              const SizedBox(
                height: 10,
              ),
              AnamneseParts(
                  anamneseSectionTitle: "Antecedants personels",
                  mapAnamneseMapData: mapAnamnesePersonelle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Maladie", style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    if (antecedantsPersonels.maladies.isEmpty)
                      const Text("Pas de maladie")
                    else
                      for (var maladie in antecedantsPersonels.maladies)
                        Text(maladie)
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnamneseParts extends StatelessWidget {
  const AnamneseParts({
    super.key,
    required this.mapAnamneseMapData,
    required this.anamneseSectionTitle,
  });

  final List<Map<String, dynamic>> mapAnamneseMapData;
  final String anamneseSectionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(anamneseSectionTitle,
            style: Theme.of(context).textTheme.headlineSmall),
        IgnorePointer(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: mapAnamneseMapData.length, // a refaire
            itemBuilder: (context, index) {
              final mapItem = mapAnamneseMapData[index];
              return ListsItemsPatient(mapItem: mapItem);
            },
          ),
        ),
      ],
    );
  }
}

class ListsItemsPatient extends StatelessWidget {
  ListsItemsPatient({
    super.key,
    required this.mapItem,
  });
  Map<String, dynamic> mapItem;
  late String itemValue = mapItem["description"];
  late String itemKey = mapItem["name"];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemKey, style: Theme.of(context).textTheme.bodySmall),
        Text(itemValue),
      ],
    );
  }
}

class Situation extends StatelessWidget {
  Situation({super.key, required this.resume});
  String resume;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 2, color: Colors.black),
        Text("Situation:", style: Theme.of(context).textTheme.headlineMedium),
        Text(
          resume,
          textAlign: TextAlign.justify,
        ),
        const Divider(thickness: 2, color: Colors.black),
        const Text("Challenge: Le patient est logorique"),
      ],
    );
  }
}
