import 'package:flutter/material.dart';


class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Welcome >> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = WelcomeApiService().getWelcome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.withOpacity(0.5),
      appBar: AppBar(
        title: Text("All Patients"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.2),
      ),
      body: FutureBuilder(future: data, builder: (context,snapshot)
      {
        if(snapshot.hasData && snapshot.data!.isNotEmpty)
        {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (value,index)
              {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Name : "+snapshot.data![index].name.toString()),
                        subtitle: Text("Symptomes: "+snapshot.data![index].symptomes.toString()+ "\n" +"Mobile : "+snapshot.data![index].mobile.toString()+ "\n" +"Status : "+snapshot.data![index].status.toString()),
                        leading: CircleAvatar(
                          child: Text(snapshot.data![index].name[0]),
                        ),
                      )
                    ],
                  ),
                );
              });
        }
        else
        {
          return CircularProgressIndicator();
        }
      }),
    );
  }
}