import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sauv'MesFeds",
                        style: Theme.of(context).textTheme.headlineLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("A propos",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const Placeholder(
                          fallbackHeight: 30,
                          fallbackWidth: 30,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Il s'agit d'une application open-source afin d'aider les étudiants à se préparer au mieux aux examens fédéral. Il n'a aucune prétention à remplacer les révisions, mais il s'agit d'une aide pour réussir au mieux vos examen. Il a été développé par un étudiant en médecine, un peu limité intelectuellement sur les bords. En espérant que cela va vous êtres utiles.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Buy Me a coffee"),
                        Text("github depository")
                      ],
                    )
                  ])),
        ),
      ),
    );
  }
}
