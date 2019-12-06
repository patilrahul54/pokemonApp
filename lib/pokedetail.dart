import 'package:flutter/material.dart';
import 'package:mypokemonapp/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }

  returnBackColor(type) {
    print(type);
    switch (type) {
      case 'Normal':
        return (Colors.grey);
        break;
      case 'Water':
        return (Colors.lightBlue);
        break;
      case 'Ground':
        return (Colors.grey);
        break;
      case 'Rock':
        return (Colors.amber);
        break;
      case 'Fire':
        return (Colors.red);
        break;
      case 'Ice':
        return (Colors.lightBlueAccent);
        break;
      case 'Flying':
        return (Colors.lightBlueAccent);
        break;
      case 'Psychic':
        return (Colors.pinkAccent);
        break;
      case 'Electric':
        return (Colors.yellow);
        break;
      case 'Grass':
        return (Colors.green);
        break;
      case 'Fighting':
        return (Colors.red);
        break;
      case 'Dark':
        return (Colors.brown);
        break;
      case 'Bug':
        return (Colors.lime);
        break;
      case 'Ghost':
        return (Colors.blue);
        break;
      case 'Dragon':
        return (Colors.purple);
        break;
      case 'Fairy':
        return (Colors.purpleAccent);
        break;
      default:
        return (Colors.amber);
    }
  }

  bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
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
                  height: 120,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        (pokemon.num + ". "),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        pokemon.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                            backgroundColor: this.returnBackColor(t),
                            onSelected: (b) {},
                          ))
                      .toList(),
                ),
                Text("Weaknesses"),
                Wrap(
                  alignment : WrapAlignment.center,
                  children: pokemon.weaknesses
                      .map((t) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FilterChip(
                                label: Text(t),
                                backgroundColor: this.returnBackColor(t),
                                onSelected: (b) {},
                              ),
                            ))
                      .toList(),
                ),
                // chekeknextEvolution(),
                (pokemon.nextEvolution != null)
                    ? Text("Next Evolution")
                    : Container(),
                (pokemon.nextEvolution != null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.nextEvolution
                            .map((f) => FilterChip(
                                  label: Text(f.name),
                                  backgroundColor: Colors.lime,
                                  onSelected: (b) {},
                                ))
                            .toList(),
                      )
                    : Container()
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pokemon.img), fit: BoxFit.cover)),
              )),
        )
      ],
    );
  }
}
