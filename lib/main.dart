import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste de Formations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> formations = [
    {
      'titre': 'Flutter pour débutants',
      'duree': '3 jours',
      'description': 'Apprenez à créer des applications mobiles simples avec Flutter et Dart.'
    },
    {
      'titre': 'Dart avancé',
      'duree': '2 jours',
      'description': 'Approfondissez vos connaissances en Dart pour des applications Flutter plus complexes.'
    },
    {
      'titre': 'UI/UX Mobile Design',
      'duree': '1 jour',
      'description': 'Apprenez les bonnes pratiques de design pour des applications mobiles attractives.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de Formations', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: formations.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.blueAccent),
                title: Text(formations[index]['titre']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: Text('Durée : ${formations[index]['duree']}'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(formation: formations[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Vous avez cliqué sur le bouton !'), duration: Duration(seconds: 2)),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> formation;

  DetailPage({required this.formation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(formation['titre']!),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formation['titre']!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Durée : ${formation['duree']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(formation['description']!, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}