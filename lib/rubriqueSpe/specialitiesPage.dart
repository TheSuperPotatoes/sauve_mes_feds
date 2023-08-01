import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:sauve_mes_feds/index/indexAll.dart';

class SpeciliatiesPages extends ConsumerStatefulWidget {
  const SpeciliatiesPages({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SpeciliatiesPagesState();
}

class _SpeciliatiesPagesState extends ConsumerState<SpeciliatiesPages> {
  @override
  Widget build(BuildContext context) {
    final specialitiesOSCEList = ref.watch(specialityOSCEprovider);

    return WillPopScope(
      onWillPop: () {
        context.go("/");
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          children: [
            const Titre(),
            const ResearchBar(),
            ListsViews(listSpecialities: specialitiesOSCEList),
          ],
        ),
      ),
    );
  }
}

class Titre extends StatelessWidget {
  const Titre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Selectionner la spécialité",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}

class ListsViews extends StatelessWidget {
  const ListsViews({
    super.key,
    required this.listSpecialities,
  });

  // List<CardSubject> createDumbList(int n) {
  //   for (var i = 0; i < n; i++) {
  //     listSpecialities.add(CardSubject());
  //   }
  //   return listSpecialities;
  // }

  final List<SpecialityOSCE> listSpecialities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 257,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: listSpecialities.length,
          itemBuilder: (context, index) {
            return CardSubject(
              specialityOSCE: listSpecialities[index],
            );
          }),
    );
  }
}

class CardSubject extends StatelessWidget {
  CardSubject({super.key, required this.specialityOSCE});
  bool isDone = false;
  SpecialityOSCE specialityOSCE;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '/sujet/${specialityOSCE.idSpe}',
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(specialityOSCE.nameSpectiality.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall),
                      Row(
                        children: [
                          Text("${specialityOSCE.idSpe}",
                              style: Theme.of(context).textTheme.bodyMedium),
                          const Icon(Icons.chevron_right_rounded)
                        ],
                      ),
                    ]),
                Text(specialityOSCE.descSpeciality,
                    style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
