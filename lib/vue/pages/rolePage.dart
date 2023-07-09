import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

class RolePage extends StatelessWidget {
  const RolePage({super.key, required this.speciality, required this.idCase});
  final String speciality;
  final String idCase;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Vous avez choisi : \n Cas clinique en $speciality. '[nom du cas]'",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Text("Êtes vous...? ",
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 5.0, color: Colors.black)),
              onPressed: () {
                context.go("/sujet/${speciality}/${idCase}/role/patient");
              },
              child: Text("Patient",
                  style: Theme.of(context).textTheme.headlineMedium)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 5.0, color: Colors.black)),
              onPressed: () {
                context.go("/sujet/${speciality}/${idCase}/role/expert");
              },
              child: Text("Expert",
                  style: Theme.of(context).textTheme.headlineMedium)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 5.0, color: Colors.black)),
              onPressed: () {
                context.go('/sujet/case/role/Medecin');
              },
              child: Text("Medecin",
                  style: Theme.of(context).textTheme.headlineMedium)),
        ],
      ),
    );
  }
}
