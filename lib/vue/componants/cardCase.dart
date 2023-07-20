// carte pour créer les items

import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:sauve_mes_feds/controlleur/index.dart';
import "package:sauve_mes_feds/models/index.dart";
//peut-être changer statefulWidget

class CardCase extends StatefulWidget {
  CardCase({super.key, required this.caseOSCE});
  CaseOSCE caseOSCE;
  @override
  State<CardCase> createState() => _CardCaseState();
}

// refactoriser, extrait composants done et not done, mettre arguments
class _CardCaseState extends State<CardCase> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.push(
              '/sujet/${widget.caseOSCE.speciality}/${widget.caseOSCE.id}/role',
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Container(
            constraints: new BoxConstraints(
              minHeight: 80.0,
              maxHeight: 100.0,
            ),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("${widget.caseOSCE.nameCas}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isFav = !_isFav;
                                  });
                                  final snackBar = SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    content: _isFav
                                        ? Text(
                                            '${widget.caseOSCE.nameCas}  a été rajouté comme favoris')
                                        : Text(
                                            "${widget.caseOSCE.nameCas}  a été enlevé des favoris"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: _isFav
                                    ? Icon(Icons.star_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary)
                                    : Icon(Icons.star_outline_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(widget.caseOSCE.isDocteur
                                ? Icons.abc
                                : Icons.abc_outlined),
                            Icon(widget.caseOSCE.isExpert
                                ? Icons.access_alarm
                                : Icons.access_alarm_outlined),
                            Icon(widget.caseOSCE.isPatient
                                ? Icons.access_time
                                : Icons.access_time_outlined),
                            Icon(Icons.chevron_right_rounded),
                          ],
                        )
                      ]),
                  Row(
                    children: [
                      Expanded(
                        child: Text("${widget.caseOSCE.resume} ",
                            softWrap: true,
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
