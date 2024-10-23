import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final List _steps = [
    {
      "title": "Buka bungkus indomie",
      "check": Icons.check_box_outline_blank,
    },
    {
      "title": "Rebus air hingga mendidih",
      "check": Icons.check_box_outline_blank,
    },
    {
      "title": "Masukkan indomie ke dalam air mendidih",
      "check": Icons.check_box_outline_blank,
    },
    {
      "title": "Masukkan bumbu indomie",
      "check": Icons.check_box_outline_blank,
    },
    {
      "title": "Aduk hingga merata",
      "check": Icons.check_box_outline_blank,
    },
    {
      "title": "Tunggu hingga matang dan indomie siap di sajikan",
      "check": Icons.check_box_outline_blank,
    },
  ];

  var _favIcon = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                //background Information
                Container(
                  width: double.infinity,
                  height: screen.height * 0.62,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 109, 53),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          "assets/indomie.jpeg",
                          scale: 2,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "indomie",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "indomie adalah mi instan populer di Indonesia yang diproduksi oleh PT Indofood Sukses Makmur Tbk, yang merupakan bagian dari Salim Group. Indomie diperkenalkan pada tahun 1972 dengan varian rasa kari ayam.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // rating & favorite button
                Positioned(
                  top: 278,
                  left: -60,
                  child: SizedBox(
                    width: 540,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('4.7/5'),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_favIcon == Icons.favorite_border_outlined) {
                                  _favIcon = Icons.favorite;
                                } else {
                                  _favIcon = Icons.favorite_border_outlined;
                                }
                              });
                            },
                            icon:  Icon(
                              _favIcon,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // TO-DO
                Positioned(
                  top: 538,
                  left: 87,
                  child: Container(
                    width: 250,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text(
                      "TO-DO",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _steps.length,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Text(
                      "${index + 1}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    title: Text(
                      _steps[index]["title"],
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        _steps[index]["check"],
                        color: const Color.fromARGB(255, 244, 203, 156),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_steps[index]["check"] ==
                              Icons.check_box_outline_blank) {
                            _steps[index]["check"] = Icons.check_box;
                          } else {
                            _steps[index]["check"] =
                                Icons.check_box_outline_blank;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
