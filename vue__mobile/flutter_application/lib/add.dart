// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class addPage extends StatefulWidget {
  const addPage({super.key, this.apparts});
  final apparts;

  @override
  State<addPage> createState() => _addPageState();
}

final imageController = TextEditingController();
final titreController = TextEditingController();
final lieuController = TextEditingController();
final prixController = TextEditingController();
final _formKey = GlobalKey<FormState>();
var selectedValue = "Maison";
TextEditingController userInput = TextEditingController();
String text = "";

class _addPageState extends State<addPage> {
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
        title: const Text(
          "Ajouter un bien Immobilié",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 19,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
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
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  controller: imageController,
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.book,
                        color: Colors.grey,
                      ),
                      labelText: "Titre",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 224, 35, 85),
                    ),
                    controller: titreController
                    // validator: (value) {},
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 315,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  value: selectedValue,
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
                      selectedValue = newValue.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.place,
                      color: Colors.grey,
                    ),
                    labelText: "Localisation",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  controller: lieuController,
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.money,
                      color: Colors.grey,
                    ),
                    labelText: "Tarif",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 224, 35, 85),
                  ),
                  controller: prixController,
                  // validator: (value) {},
                ),
              ),
              const SizedBox(
                height: 39,
              ),
              Container(
                width: 315,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 35, 85),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      var newAppart = {
                        "image": imageController.value.text,
                        "titre": titreController.value.text,
                        "type": selectedValue,
                        "lieu": lieuController.value.text,
                        "prix": prixController.value.text,
                        "vendu": 0,
                        "id_proprio": 1,
                      };
                      sendData(newAppart);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Ajouter",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendData(newAppart) async {
    const uri = "http://192.168.252.170:3000/api/apparts/addApparts";
    final apiUri = Uri.parse(uri);
    await http.post(
      apiUri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(newAppart),
    );
  }
}
