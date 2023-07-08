// Generated code for this TabBar Widget...
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sauve_mes_feds/vue/componants/index.dart';

class ECOSPatientExpertPage extends StatelessWidget {
  const ECOSPatientExpertPage({super.key});

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
                    "[str name_categorie] : [str name_cas]",
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
                      child: const TabBarView(children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: PatientView(),
                        ),
                        ExpertView()
                      ]))
                ],
              )),
        ),
      ),
    );
  }
}

class ExpertView extends StatelessWidget {
  const ExpertView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Situation(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Text("Anamnèse",
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        AnamneseSection(),
        Status(),
        Laboratoire(),
        Management(),
        Timer(),
      ],
    ));
  }
}

class PatientView extends StatelessWidget {
  const PatientView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Cas [STR name_cas]",
              style: Theme.of(context).textTheme.headlineMedium),
          Situation(),
          Text("Il reste: [Timer]",
              style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Challenge: Le patient est logorique");
  }
}

class Situation extends StatelessWidget {
  const Situation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 2, color: Colors.black),
        Text("Situation: [STR resume]",
            style: Theme.of(context).textTheme.headlineMedium),
        Divider(thickness: 2, color: Colors.black),
        Challenge()
      ],
    );
  }
}

class Anamnese extends StatelessWidget {
  Anamnese({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Anamnèse")],
    );
  }
}

//___________________EXPERT VIEW___________________

class AnamneseSection extends StatelessWidget {
  const AnamneseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("[str item_section]",
                style: Theme.of(context).textTheme.headlineSmall),
            Container(
              padding: EdgeInsets.all(5),
              child: Text("[notDone/done]",
                  style: Theme.of(context).textTheme.bodySmall),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        ),
        AnamneseSecItems()
      ],
    );
  }
}

class AnamneseSecItems extends StatefulWidget {
  AnamneseSecItems({super.key});

  @override
  State<AnamneseSecItems> createState() => _AnamneseSecItemsState();
}

class _AnamneseSecItemsState extends State<AnamneseSecItems> {
  late bool isDone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isDone = !isDone;
                  });
                },
                icon: isDone
                    ? Icon(Icons.check_box)
                    : Icon(Icons.check_box_outline_blank)),
            Text("[str item_name]")
          ],
        ),
        Text("[str item_description]")
      ],
    );
  }
}

class Status extends StatelessWidget {
  Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Status", style: Theme.of(context).textTheme.headlineMedium),
        Text("[items]")
      ],
    );
  }
}

class Laboratoire extends StatelessWidget {
  Laboratoire({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Laboratoire", style: Theme.of(context).textTheme.headlineMedium),
        Text("[items]")
      ],
    );
  }
}

class Management extends StatelessWidget {
  Management({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Management",
                style: Theme.of(context).textTheme.headlineMedium),
            Icon(Icons.arrow_right),
          ],
        ),
        Text("Mettre items flous")
      ],
    );
  }
}
