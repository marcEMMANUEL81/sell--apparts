// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'chart.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future fetchStats() async {
//   const uriFree = 'http://192.168.252.170:3002/getFreeApparts.php';
//   const uriUsed = 'http://192.168.252.170:3002/getSellsApparts.php';
//   final API_URI_FREE = Uri.parse(uriFree);
//   final API_URI_USED = Uri.parse(uriUsed);
//   var responseFree = await http.get(API_URI_FREE);
//   var responseUsed = await http.get(API_URI_USED);
//   final bodyFree = responseFree.body;
//   final bodyUsed = responseUsed.body;
//   final jsonResponseFree = json.decode(bodyFree);
//   final jsonResponseUsed = json.decode(bodyUsed);
//   var value = [jsonResponseFree, jsonResponseUsed];
//   return [value[0]['nbrAppartsLibre'], value[1]['nombreVente']];
// }

class stat extends StatelessWidget {
  const stat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Statistiques",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 19,
          ),
        ),
      ),
      body: const Center(
        child: DoughnutChartExample(),
      ),
    );
  }
}
