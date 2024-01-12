import 'package:flutter/material.dart';

const cards = <Map<String,dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];



class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = "card_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards screen"),
      ),
      body:const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    //! Las columnas son un widget que suele desbordarse con mucha facilidad, la forma de solucionar dicho problema es la siguiente: 

    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType1(label: card['label'], elevation: card["elevation"]) ),
          const SizedBox(height: 50,),
          ...cards.map((card) => _CardType2(label: card['label'], elevation: card["elevation"]) ),
          const SizedBox(height: 50,),
          ...cards.map((card) => _CardType3(label: card['label'], elevation: card["elevation"]) ),
          const SizedBox(height: 50,),
          ...cards.map((card) => _CardType4(label: card['label'], elevation: card["elevation"]) ),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({
    required this.label, 
    required this.elevation
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){}
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )

          ],
        ),
      ),
    );
  }
}


class _CardType2 extends StatelessWidget {
  const _CardType2({
    required this.label, 
    required this.elevation
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all( Radius.circular(15)),
        side: BorderSide(
          color: colors.outline
        ) 
      ),
      elevation: elevation,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){}
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("outlined: $label"),
            )

          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  const _CardType3({
    required this.label, 
    required this.elevation
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){}
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("fill: $label"),
            )

          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  const _CardType4({
    required this.label, 
    required this.elevation
  });

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      //clipbehavior va para arreglar los hijos de la card
      clipBehavior: Clip.hardEdge,
      color: colors.surfaceVariant,
      elevation: elevation,
      child:  Stack(
        children: [
          Image.network(
            "https://picsum.photos/id/${elevation.toInt()}/600/350",
            height: 350,
            fit: BoxFit.cover,
          ),
      
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(48, 255, 255, 255),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined, color: Colors.white,),
                onPressed: (){}
              ),
            )
          ),
          Align(
            
            alignment: Alignment.bottomCenter,
            child: Container(
              
              decoration: const BoxDecoration(
                color: Color.fromARGB(48, 255, 255, 255),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                child: Text("Some text: $label", style: const TextStyle(color: Colors.white) )
              ),
            ),
          )
      
        ],
      ),
    );
  }
}


