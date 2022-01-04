import 'package:http/http.dart' as http;
import 'package:tudo_assignment/models/character_list_model.dart';


class ApiServices {
  static var client = http.Client();

  static Future<List<ListofCharacter>?> fetchEvents() async {
    var response = await client.get(
        Uri.parse("https://breakingbadapi.com/api/characters?limit=10&offset=0"),
        headers:{"Keep-Alive":"1000"}
    );
    if (response.statusCode == 200) {
      var jsonResponse = listofCharacterFromJson(response.body);

      return jsonResponse;
    }
    else{
      return null;
    }
  }
}