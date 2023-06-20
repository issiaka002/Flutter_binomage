

import 'package:bino/Composants/liste_bino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final List<List<String>> products = [
  [
    'assets/images/noirr.jpg',
    'Envenement unique',
    'Obetenir un parrain qui pourra vous encardrer'
  ],
  [
    'assets/images/relation.jpg',
    'Renforcer les relations',
    'Faite la connaissance d\'autre eleve'
  ],
  [
    'assets/images/eleve.jpg',
    'Premier but le reseautage',
    'Se connaitre, s\'entraider et reussir'
  ]
];
int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length -1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details){
              if(details.velocity.pixelsPerSecond.dx > 0){
                _preve();
              }else if(details.velocity.pixelsPerSecond.dx < 0){
                _next();
              }
            },
            child: Container(
              width: double.infinity,
              height: 550,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(products[currentIndex][0]),
                  fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.grey[700]!.withOpacity(.9),
                      Colors.grey.withOpacity(.0),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 90,
                      margin: const EdgeInsets.only(bottom: 60),
                      child: Row(
                        children: _buildIndicator(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(products[currentIndex][1], style: TextStyle(color: Colors.grey[800], fontSize: 30, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        // Text(products[currentIndex][2], style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 20),),
                        Icon(Icons.star, size: 20, color: Colors.yellow[700],),
                        const SizedBox(width: 10,),
                        Text(products[currentIndex][2], style: TextStyle(color: Colors.grey.shade400, fontSize: 15),),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: TextButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ListeBino();
                                  },
                                ),
                              );

                            }, 
                            child: const Text("Commencer", style: TextStyle(fontSize: 17 ,color: Colors.white ,fontWeight: FontWeight.bold),),)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 
  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.grey[800] : Colors.white
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for(int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }


}
