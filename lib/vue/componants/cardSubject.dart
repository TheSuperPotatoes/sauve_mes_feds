import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:sauve_mes_feds/controlleur/stateManagerSpecialities.dart';

class CardSubject extends StatelessWidget {
  CardSubject({super.key, required this.specialityOSCE});
  bool isDone = false;
  SpecialityOSCE specialityOSCE;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '/sujet/${specialityOSCE.nameSpectiality}',
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
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
                      Text("${specialityOSCE.nameSpectiality.toUpperCase()}",
                          style: Theme.of(context).textTheme.headlineSmall),
                      Row(
                        children: [
                          Text("[done]/[total]",
                              style: Theme.of(context).textTheme.bodyMedium),
                          const Icon(Icons.chevron_right_rounded)
                        ],
                      ),
                    ]),
                Text("${specialityOSCE.descSpectiality}",
                    style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
