// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Informations sur le bien",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.height,
            child: const Text(
              "Appartement_Appartement class",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.height,
            child: const Text(
              "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi non placeat sint alias incidunt perferendis harum. Qui nostrum tenetur suscipit, repudiandae eius ut maiores sequi officiis doloremque rem deserunt ratione.",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.height,
            child: const Text(
              "Localisation: Anono ...",
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: 360,
            child: Text(
              "360000 Fcfa",
            ),
          ),
        ),
      ],
    );
  }
}
