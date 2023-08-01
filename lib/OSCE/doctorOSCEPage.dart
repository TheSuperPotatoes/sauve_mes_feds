// Generated code for this TabBar Widget...
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sauve_mes_feds/index/indexAll.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class ECOSDoctorPage extends StatelessWidget {
  ECOSDoctorPage({super.key});
  DoctorCase content = docteurUrgence1;
  //instaurer un ötate avec StateProvider pour médecin/expert/patient
  @override
  Widget build(BuildContext context) {
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
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                      child: Text('Oui',
                          style: Theme.of(context).textTheme.bodyMedium),
                      onPressed: () {
                        context.go('/sujet/${content.speciality}');
                        ref.watch(timerProvider.notifier).restart();
                        ref.watch(timerProvider.notifier).dispose();
                        Navigator.pop(context);
                      },
                    );
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    content.placeInit,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Timer(),
                const SizedBox(
                  height: 20,
                ),
                Text("Situation",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("""${content.intro}""",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 10,
                ),
                Text("Constante",
                    style: Theme.of(context).textTheme.titleLarge),
                ListsItemsDoctor(map: content.constantes),
                Text("Objectifs",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("Vous avez 13 minutes pour",
                    style: Theme.of(context).textTheme.headlineSmall),
                Column(
                  children: [
                    for (var i = 0; i < content.objectifs.length; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Text(i.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ),
                          Expanded(
                            child: Text(
                              content.objectifs[i],
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}

class ListsItemsDoctor extends StatelessWidget {
  ListsItemsDoctor({super.key, required this.map});
  Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: map.length,
        itemBuilder: (BuildContext context, int index) {
          String key = map.keys.elementAt(index);
          dynamic value = map[key];

          // Utilisez key et value pour afficher les données dans votre widget
          // par exemple, utilisez un ListTile pour chaque élément du Map

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(key, style: Theme.of(context).textTheme.bodySmall),
              Text(value.toString()),
            ],
          );
        },
      ),
    );
  }
}
