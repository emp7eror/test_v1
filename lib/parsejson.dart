import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;


// ignore: non_constant_identifier_names
Future <String> get_url (String data) async {
  String itemCount ;
  String cod=data;
  //return(cod);
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = "http://23.23.167.118/api/check/certificate/9162191685";

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
     itemCount = jsonResponse['barcode'];
    return new Future<String>(() {
      //Do a long running task. E.g. Network Call.
      //Return the result
      return(itemCount);
    });

    //print("Number of books about http: $itemCount.");
  return itemCount;
  } else {
    return("Request failed with status: ${response.statusCode}.");
  }
}

