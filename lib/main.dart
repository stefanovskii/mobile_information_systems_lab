import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab1_MIS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Predmeti(),
    );
  }
}

class Predmeti extends StatefulWidget {
  const Predmeti({super.key});

  @override
  State<Predmeti> createState() => _PredmetiState();
}

class _PredmetiState extends State<Predmeti> {

  List<String> _subjects = ["МИС", "ТП", "ВБС", "СЗВС", "ПНВИ"];

  void addSubject(){
    showDialog(context: context, builder: (BuildContext context){
      String newSubject = "";
      return AlertDialog(
        title: const Text("Додади нов предмет:"),
        content: TextField(
          onChanged: (value){
            newSubject = value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  if(newSubject.isNotEmpty){
                    _subjects.add(newSubject);
                  }
                  Navigator.pop(context);
                });
              },
              child: const Text("Додади"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Листа на предмети"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _subjects.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(_subjects[index], style: const TextStyle(fontSize: 20),),
                trailing: IconButton(icon: const Icon(Icons.delete_rounded),onPressed: (){
                  setState(() {
                    _subjects.removeAt(index);
                  });
                },),
              ),
            );
          })
      ),
      floatingActionButton: FloatingActionButton(onPressed: addSubject,
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
