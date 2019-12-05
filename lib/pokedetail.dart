import 'package:flutter/material.dart';
import 'package:mypokemonapp/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height /  1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.12,
          child: Card( 
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Height : ${pokemon.height}"),
                Text("Weight : ${pokemon.weight}"),
                Text("Types :"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((t) => FilterChip(
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.teal,
                            onSelected: (b) {},
                          ))
                      .toList(),
                ),
                Text("Weaknesses"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses
                      .map((t) => FilterChip(
                            label: Text(t),
                            backgroundColor: Colors.amber,
                            onSelected: (b) {},
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(tag: pokemon.img, child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(pokemon.img), fit: BoxFit.cover)
            ),
          )),
        )
      ],
    );
  }
}
