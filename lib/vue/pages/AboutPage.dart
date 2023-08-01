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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Concernant cette app",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Il s'agit d'une application open-source afin d'aider les étudiants à se préparer au mieux aux examens fédéraux. Il n'a aucune prétention à remplacer les révisions, mais il s'agit d'une aide pour vous aider dans la réussite de vos examens. Il a été développé par un étudiant en médecine, un peu limité intelectuellement sur les bords qui c'est lancé dans cette petite avanture. Si vous voulez le soutenir das ce petit périple, offrez-lui un café ;). En espérant que cela va vous être utile. ",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Text(
                          "-V.N",
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
