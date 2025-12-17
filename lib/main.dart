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
      'titre': 'Angular',
      'duree': '2 jours',
      'description':
      'Apprenez à créer des applications WEB à base de google.',
      'image': 'assets/images/angular_gradient.png',
    },
    {
      'titre': 'Flutter pour débutants',
      'duree': '3 jours',
      'description':
      'Apprenez à créer des applications mobiles simples avec Flutter et Dart.',
      'image': 'assets/images/flutter.jpeg',
    },
    {
      'titre': 'Dart avancé',
      'duree': '2 jours',
      'description':
      'Approfondissez vos connaissances en Dart pour des applications Flutter plus complexes.',
      'image': 'assets/images/dart.jpeg',
    },
    {
      'titre': 'UI/UX Mobile Design',
      'duree': '1 jour',
      'description':
      'Apprenez les bonnes pratiques de design pour des applications mobiles attractives.',
      'image': 'assets/images/uiux.jpeg',
    },
    {
      'titre': 'bazic',
      'duree': 'A votre rythme',
      'description':
      'Acquerir les bonnes bases avec bazic pour le digital',
      'image': 'assets/images/astuce_digital.jpg',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste de Formations',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: formations.length,
          itemBuilder: (context, index) {
            final formation = formations[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset(
                  formation['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  formation['titre']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text('Durée : ${formation['duree']}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(formation: formation),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vous avez cliqué sur le bouton !'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> formation;

  const DetailPage({required this.formation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(formation['titre']!),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              formation['image']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              formation['titre']!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Durée : ${formation['duree']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              formation['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
