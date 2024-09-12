import 'package:flutter/material.dart';
import 'package:quizfootball/sqlflit.dart';


class Record extends StatelessWidget {
  final SqlDb sqlDb = SqlDb();
  Future<List<Map>> readData() async{
    List<Map> response = await sqlDb.readData("notes");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سجل التحديات'),
        centerTitle: true,
      ),
      body: ListView(
        children: [FutureBuilder(
          future: readData(),
          builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData){
            return ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: snapshot.data!.length,itemBuilder: (context, i) {
              return Card(
                child: Text("${snapshot.data![i]['Team1']}  vs  ${snapshot.data![i]['Team2']}     the result: ${snapshot.data![i]['result']}"),
              );
              
              });
              } else {
                return Text('No Data');
              }}
              )
        ]
            
        )
            );
          }
          }
    