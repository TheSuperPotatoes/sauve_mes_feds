import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import "package:sauve_mes_feds/controlleur/stateManagerSpecialities.dart";
import "../vue/mainIndex.dart";

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
          path: '/sujet/:idSubjects/:id_case/role/:role', //mettre id
          pageBuilder: (context, state) {
            //mettre une fonction switch
            return MaterialPage<dynamic>(child: ECOSPatientExpertPage());
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
