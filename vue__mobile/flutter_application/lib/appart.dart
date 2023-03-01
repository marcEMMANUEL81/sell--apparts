// ignore_for_file: camel_case_types, must_be_immutable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class appart extends StatefulWidget {
  const appart({
    super.key,
    this.image,
    this.titre,
    this.selectedValue,
    this.lieu,
    this.prix,
    this.id
  });

  final image;
  final titre;
  final selectedValue;
  final lieu;
  final prix;
  final id;

  @override
  State<appart> createState() => _appartState();
}

class _appartState extends State<appart> {
  late final imageController = TextEditingController(text: widget.image);
  late final titreController = TextEditingController(text: widget.titre);
  late final lieuController = TextEditingController(text: widget.lieu);
  late final prixController =
      TextEditingController(text: widget.prix.toString());
  final _formKey = GlobalKey<FormState>();
  var valueToUse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.selectedValue,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 19,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ClipRRect(
              //   child: Image.network(
              //     image,
              //     height: 180,
              //     width: 500,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    labelText: "Image",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: imageController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    labelText: "titre",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: titreController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  value: widget.selectedValue,
                  items: <String>[
                    "Maison",
                    'Appartement',
                    'Magasin',
                    "Espace evênementiel",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          // fontFamily: 'FuturaPT',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color.fromARGB(255, 224, 35, 85),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      valueToUse = newValue.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    labelText: "Lieu",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: lieuController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    labelText: "Tarif",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: prixController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 35, 85),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      valueToUse = widget.selectedValue;
                      var newAppart = {
                        "image": imageController.value.text,
                        "titre": titreController.value.text,
                        "type": valueToUse,
                        "lieu": lieuController.value.text,
                        "prix": prixController.value.text,
                        "vendu": 0,
                        "id_proprio": 1,
                      };
                      print(newAppart);
                      sendData(newAppart);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Modifier",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 345,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 35, 85),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      deleteData();
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Supprimer",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        padding: EdgeInsets.all(22),
        color: Colors.white,
      ),
    );
  }

  sendData(newAppart) async {
    var id = widget.id;
    var uri = "http://192.168.252.170:3001/api/apparts/modifyOneAppart/" +
        id.toString();
    final apiUri = Uri.parse(uri);
    await http.put(
      apiUri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(newAppart),
    );
  }

  deleteData() async {
    var id = widget.id;
    var uri = "http://192.168.252.170:3000/api/apparts/deleteApparts/" +
        id.toString();
    final apiUri = Uri.parse(uri);
    await http.delete(
      apiUri,
      headers: {"Content-Type": "application/json"},
    );
  }
}
