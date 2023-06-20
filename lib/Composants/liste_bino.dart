import 'package:bino/Composants/addBinomage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class ListeBino extends StatefulWidget {
  const ListeBino({super.key});

  @override
  State<ListeBino> createState() => _ListeBinoState();
}


class _ListeBinoState extends State<ListeBino> {
  dynamic notes = [];
  late bool loading;

  void deleteNote(int id) async {
    loading = true;
    setState(() {});

    var url =
        Uri.parse('https://x8ki-letl-twmt.n7.xano.io/api:TbaNPujl/binomage/$id');
    await http.delete(url);

    loadNotes();
  }

  void loadNotes() async {
    loading = true;

    var url = Uri.parse('https://x8ki-letl-twmt.n7.xano.io/api:TbaNPujl/binomage');
    var response = await http.get(url);
    notes = jsonDecode(response.body);

    loading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyHomePage(title: 'Liste binomage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/eleve.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //const Text("What you would like to find?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 12,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.white,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                          hintText: "Recherche ..."
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: 11,),
            Column(
              children: [
                const SizedBox(height: 13),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text("Bino_info2"),
                        
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.all_inclusive_outlined),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: null, icon: Icon(Icons.delete, color: Color.fromARGB(255, 255, 7, 7)),),
                            //SizedBox(width: ), 
                            IconButton(onPressed: null, 
                            icon:Icon(Icons.arrow_circle_right_outlined, color: Color.fromARGB(255, 243, 35, 35),),),
                          ],
                        ),
                      ),

                      
                      
                      
                    ],                                      
                  ),                  
                ),                
              ],              
            ),            
          ],          
        ),
      ),      
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddBinomage();
                  },
                ),
              );
            },
            hoverColor: Colors.deepPurple,
            label: const Text("Ajouter",),
            icon: const Icon(Icons.add),
            backgroundColor: const Color.fromARGB(255, 233, 27, 27),
          );
        }
      ),
    );
  }

  //...
}
