import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import "../vue/mainIndex.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'index.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(backgroundColor: Colors.white, body: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<dynamic>(child: HomePage());
          },
        ),
        GoRoute(
          path: '/sujets',
          pageBuilder: (context, state) {
            return MaterialPage<dynamic>(child: SpeciliatiesPages());
          },
        ),
        GoRoute(
          path: '/sujet/:idSubjects', //mettre id

          pageBuilder: (context, state) {
            var idSubjects = state.pathParameters['idSubjects'].toString();
            return MaterialPage<dynamic>(
                child: CasesPages(
              specialityName: idSubjects,
            ));
          },
        ),
        GoRoute(
          path: '/sujet/:idSubjects/:id_case/role', //mettre id
          pageBuilder: (context, state) {
            String speciality = state.pathParameters["idSubjects"]!;
            return MaterialPage<dynamic>(
                child: RolePage(
              speciality: speciality,
            ));
          },
        ),
        GoRoute(
          path: '/sujet/:idSubjects/:idCase/role/:role', //mettre id
          pageBuilder: (context, state) {
            //mettre une fonction switch
            String speciality = state.pathParameters["idSubjects"]!;
            String idCase = state.pathParameters["idCase"]!;
            final container = ProviderContainer();
            final casesOSCE = container
                .read(caseOSCEProvider)
                .where((element) =>
                    element.id == idCase && element.speciality == speciality)
                .toList();
            container.dispose();

            return MaterialPage<dynamic>(
                child: ECOSPatientExpertPage(caseOSCE: casesOSCE[0]));
          },
        ),
        GoRoute(
          path: '/sujet/case/role/Medecin', //mettre id
          pageBuilder: (context, state) {
            return MaterialPage<dynamic>(child: ECOSDoctorPage());
          },
        )
      ],
    ),
  ],
);
