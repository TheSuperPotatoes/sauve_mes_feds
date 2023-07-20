// Generated code for this TabBar Widget...

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sauve_mes_feds/controlleur/timerStat.dart';
import 'package:sauve_mes_feds/vue/componants/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sauve_mes_feds/controlleur/index.dart';

class ECOSPatientExpertPage extends ConsumerWidget {
  ECOSPatientExpertPage(
      {super.key, required this.idCase, required this.speciality});
  String idCase;
  String speciality;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseOSCE = ref.read(caseOSCEProvider).firstWhere((items) =>
        items.id == int.parse(idCase) && items.speciality == speciality);

    return WillPopScope(
      onWillPop: () async {
        // Code à exécuter lorsque le bouton "Retour" est appuyé
        // Retournez true si vous souhaitez autoriser le retour ou false pour l'empêcher

        // Exemple : Afficher une boîte de dialogue de confirmation avant de quitter l'application
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
                    ref.watch(timerProvider.notifier).restart();
                    ref.watch(timerProvider.notifier).dispose();
                    context.go('/sujet/case');
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
        child: SizedBox(
          width: 100,
          child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Text(
                    "Cas pratiques",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "${caseOSCE.speciality}: ${caseOSCE.nameCas}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Divider(
                    thickness: 2,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Align(
                      alignment: const Alignment(0, 0),
                      child: TabBar(
                          labelColor: Theme.of(context).colorScheme.tertiary,
                          tabs: [Tab(text: "PATIENT"), Tab(text: "EXPERT")])),
                  SizedBox(
                      height: MediaQuery.of(context).size.height - 188,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: PatientView(caseOSCE: caseOSCE),
                          ),
                        ),
                        SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: ExpertView(caseOSCE: caseOSCE)))
                      ]))
                ],
              )),
        ),
      ),
    );
  }
}
