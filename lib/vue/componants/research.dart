import 'package:flutter/material.dart';

class ResearchBar extends StatelessWidget {
  const ResearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          cursorColor: Theme.of(context).colorScheme.tertiary,
          decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintText: 'Rechercher',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
              prefixIcon: const SizedBox(
                width: 18,
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black,
                ),
              )),
        ),
      ),
    );
  }
}
