import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:sauve_mes_feds/controlleur/stateManagerSpecialities.dart';
import '../mainIndex.dart';

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
            Titre(),
            ResearchBar(),
            ListsViews(listSpecialities: specialitiesOSCEList),
          ],
        ),
      ),
    );
    ;
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
      height: MediaQuery.of(context).size.height - 203,
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
