import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Equipment {
  final String pn;
  final String designation;
  final int locationID;
  String imgUrl;

  Equipment(this.pn, this.designation, this.locationID);

  Future getImgUrl() async {
    if (imgUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      // Use darts Uri builder
      var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(UTF8.decoder).join();
      var json = JSON.decode(responseBody);
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      var url = json['message'];
      imgUrl = url;
    } catch (exception) {
      print(exception);
    }
  }
}
