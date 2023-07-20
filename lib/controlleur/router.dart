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
          path: '/about',
          pageBuilder: (context, state) {
            return MaterialPage<dynamic>(child: AboutPage());
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
          path: '/sujet/:idSubjects/:idCase/role', //mettre id
          pageBuilder: (context, state) {
            String speciality = state.pathParameters["idSubjects"]!;
            String idCase = state.pathParameters["idCase"]!;
            return MaterialPage<dynamic>(
                child: RolePage(
              idCase: idCase,
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

            return MaterialPage<dynamic>(
                child: ECOSPatientExpertPage(
                    idCase: idCase, speciality: speciality));
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
