import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body; // the content of APIs

      return jsonDecode(data); // obtain json file with format : key : value 
    } else {
      print(response.statusCode); //type of error
    }
  }
}
