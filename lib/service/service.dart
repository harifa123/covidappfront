import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class WelcomeApiService
{
  getData(String phone) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://localhost:3001/api/patient/search");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "phone" : phone
      }
      ),
    );
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return welcomeFromJson(resp);
    }
    else
    {
      throw Exception("no data");
    }
  }
  Future<dynamic> sendData(
      String name,String symptom,String phone,String status,String address
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://localhost:3001/api/patient/patiententry");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "name": name,
        "phone": phone,
        "address": address,
        "symptom": symptom,
        "status": status,
      }
      ),
    );
    if(response.statusCode==200)
    {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else
    {
      throw Exception("Failed to send data");
    }
  }
  Future<List<Welcome >> getWelcome() async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://localhost:3001/api/patient/viewall");
    var response = await client.get(apiUri);
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return welcomeFromJson(resp);
    }
    else
    {
      return [];
    }
  }
}