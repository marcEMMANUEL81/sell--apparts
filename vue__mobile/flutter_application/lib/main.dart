// ignore_for_file: camel_case_types, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, must_be_immutable
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application/appart.dart';
import 'package:flutter_application/stat.dart';
import 'add.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'view.dart';

void main() async {
  final apparts = await fetchApparts();
  runApp(MyApp(apparts: apparts));
}

fetchApparts() async {
  const uri = "http://192.168.252.170:3001/api/apparts/getApparts";
  final API_URI = Uri.parse(uri);
  final response = await http.get(API_URI);
  final body = response.body;
  final jsonResponse = json.decode(body);
  return jsonResponse['results'];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.apparts});
  final apparts;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const view()

        // MyHomePage(
        //   apparts: apparts,
        // ),
        );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, this.apparts});
  final apparts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "   Biens Immobiliés",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: apparts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => appart(
                              image: apparts[index]['image'],
                              titre: apparts[index]['titre'],
                              selectedValue: apparts[index]['type'],
                              lieu: apparts[index]['lieu'],
                              prix: apparts[index]['prix'],
                              id: apparts[index]['id_appart'],
                            ),
                          ),
                        );
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.only(bottom: 15),
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 29, 29, 29),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  apparts[index]['image'],
                                  height: 90,
                                  width: 165,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              SizedBox(
                                width: 170,
                                child: Text(
                                  "    " +
                                      apparts[index]['titre'].toLowerCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 139,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      apparts[index]['lieu'],
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(134, 255, 255, 255),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 30, top: 10),
            child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 39, 39, 39),
              padding: const EdgeInsets.all(13),
              tabs: [
                GButton(
                  icon: Icons.home,
                  onPressed: () {},
                  iconColor: Colors.white,
                  text: "Accueil",
                ),
                GButton(
                  icon: Icons.add,
                  onPressed: () {},
                  iconColor: Colors.white,
                  text: "Ajouter",
                ),
                GButton(
                  icon: Icons.stairs_outlined,
                  onPressed: () {},
                  iconColor: Colors.white,
                  text: "Statistiques",
                ),
                GButton(
                  icon: Icons.settings,
                  onPressed: () {},
                  iconColor: Colors.white,
                  text: "Paramètres ",
                ),
              ],
            ),
          )),
      drawer: const Drawer(
        surfaceTintColor: Colors.black,
        child: SingleChildScrollView(
            child: SizedBox(
          child: myList(),
        )),
      ),
    );
  }
}

class myList extends StatefulWidget {
  const myList({super.key});

  @override
  State<myList> createState() => _myListState();
}

class _myListState extends State<myList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          const SizedBox(
            width: 230,
            child: Text(
              'Navigation',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const addPage(),
                ),
              );
            },
            child: Container(
              width: 230,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(162, 209, 209, 209),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Ajouter un bien',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 206, 53, 53),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Color.fromARGB(31, 65, 65, 65),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const stat()),
              );
            },
            child: Container(
              width: 230,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(162, 209, 209, 209),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Voir les statistiques',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 206, 53, 53),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Color.fromARGB(31, 65, 65, 65),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
