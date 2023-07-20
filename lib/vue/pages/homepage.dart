import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:go_router/go_router.dart";
import 'package:sauve_mes_feds/controlleur/stateManagerUsers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
//Mettre une image
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              /*Image(),*/ Text("Sauv'MesFeds",
                  style: Theme.of(context).textTheme.headlineLarge),
            ]),
            const Profil(),
            const Navigator()
          ]),
        ),
      ),
    );
  }
}

//Introduction onBoarding par des display https://pub.dev/packages/introduction_screen/install

class Profil extends ConsumerWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          radius: 25,
        ),
        Text(
          "![greeting] ${user.fullname}",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

class Navigator extends StatelessWidget {
  const Navigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          CardItems(
              title: "QCM",
              description: "En construction...",
              color: Theme.of(context).colorScheme.background,
              icons: Icons.album,
              route: () {}),
          CardItems(
            title: "ECOS",
            description: "Prépare toi à crach er sur le patient",
            color: Theme.of(context).colorScheme.secondary,
            icons: Icons.album,
            route: () => context.push('/sujets'),
          ),
          CardItems(
              title: "Profil",
              description: "Tes scores, tes performances et ta tronche",
              color: Theme.of(context).colorScheme.secondary,
              icons: Icons.album,
              route: () {}),
          CardItems(
              title: "A propos de nous",
              description: "Kékia développé ce truc?",
              color: Theme.of(context).colorScheme.secondary,
              icons: Icons.album,
              route: () => context.push('/about'))
        ],
      )
    ]);
  }
}

// CARD ITEMS
class CardItems extends StatelessWidget {
  CardItems(
      {super.key,
      required this.title,
      required this.description,
      required this.color,
      required this.icons,
      required this.route});
  void Function()? route;
  IconData icons;
  String title;
  String description;
  Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          color: color,
          child: ListTile(
            leading: Icon(
              icons,
              size: 20,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
