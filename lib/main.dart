import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypokemonapp/pokedetail.dart';
import 'package:mypokemonapp/pokemon.dart';

void main() => runApp(MaterialApp(
      title: "My Pokemon App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokeHub;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    pokeHub = null;
    setState(() {});
    var res = await http.get(url);
    var jsondede = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(jsondede);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        elevation: 0.0,
        backgroundColor: Colors.red,
      ),
      // drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          this.fetchData();
        },
      ),
      body: pokeHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(4.0),
              children: pokeHub.pokemon
                  .map((poke) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokeDetail(
                                        pokemon: poke,
                                      )));
                        },
                        child: Card(
                          elevation: 4.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                child: Container(
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(poke.img))),
                                ),
                                tag: poke.img,
                              ),
                              Wrap(
                                alignment : WrapAlignment.center,
                                children: <Widget>[
                                  Text(
                                    (poke.num + ". "),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
            // backgroundColor: Colors.redAccent,
    );
  }
}
