import 'package:flutter/material.dart';
import '../../card/dbHelper.dart';
import '../../models/planet.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DataBase handler;
  Future<int> addUsers() async {
    Planets firstPlanet =
    Planets(name: "Mercury", age: 24, id: 1, distancefromsun: 10);
    Planets secondPlanet =
    Planets(name: "Venus", age: 31, id: 2, distancefromsun: 20);
    Planets thirdPlanet =
    Planets(id: 3, name: 'Earth', age: 4, distancefromsun: 30);
    Planets fourthPlanet =
    Planets(id: 4, name: 'Mars', age: 5, distancefromsun: 40);

    List<Planets> planets = [firstPlanet, secondPlanet,thirdPlanet,fourthPlanet];
    return await handler.insertPlanets(planets);
  }

  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      await addUsers();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: handler.retrievePlanets(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Planets>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].age.toString()),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
