import 'package:flutter/material.dart';

import '../model/model.dart';
import '../service/service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String phone="";
  TextEditingController n1 = new TextEditingController();
  List<Welcome> searchResults = [];

  void searchapi() async
  {
    phone = n1.text;
    final response = await WelcomeApiService().getData(phone);
    if(response.isNotEmpty)
    {
      setState(() {
        searchResults = response;
      });
    }
    else
    {
      showSimplePopup(context, "Not Found!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.withOpacity(0.5),
      appBar: AppBar(
        title: Text("Search Patient"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.2),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(34),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              TextField(
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "Mobile number",
                    labelStyle: TextStyle(color: Colors.black),
                  )
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: searchapi, child: Text("Search")),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context,index)
                    {
                      final patient = searchResults[index];
                      return ListTile(
                        tileColor: Colors.lightBlueAccent.withOpacity(0.3),
                        title: Text("Name: "+patient.name),
                        subtitle: Text("Mobile No: "+patient.phone+ "\n" +"Symptomes: "+patient.symptom + "\n" +"Status: "+patient.status+ "\n" +"Address: "+patient.address,style: TextStyle(color: Colors.black),),
                        leading: CircleAvatar(
                          child: Text(patient.name[0]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSimplePopup(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}