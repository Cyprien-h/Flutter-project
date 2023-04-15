import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> RecupApi() async {
  try {
    var url = Uri.parse('https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/?');
    var response = await http.get(url);

    var data = jsonDecode(response.body);
    for (var game in data['response']['games']) {
      print(game['name']);
    }

  } catch (e) {
    print('Erreur lors de la récupération des données de l\'API: $e');
  }
}
