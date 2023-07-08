// Generated code for this TabBar Widget...
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ECOSDoctorPage extends StatelessWidget {
  const ECOSDoctorPage({super.key});
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
                ElevatedButton(
                  child: Text('Oui',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Vous êtes stagiaire au cabinet du Dr.Rochat",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text("[Temps restant]",
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(
                  height: 20,
                ),
                Text("Situation",
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                    """'A pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur'""",
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(
                  height: 20,
                ),
                Text("Constante",
                    style: Theme.of(context).textTheme.titleLarge),
                Row(
                  children: [
                    Text("Pression"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("[valeure]")
                  ],
                ),
                Row(
                  children: [Text("Pression"), Text("[valeure]")],
                ),
                Row(
                  children: [Text("Pression"), Text("[valeure]")],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Objectifs",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("Vous avez 13 minutes pour"),
                SizedBox(
                  height: 20,
                ),
                Text("Examens complémentaires",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center),
              ],
            )),
      ),
    );
  }
}
