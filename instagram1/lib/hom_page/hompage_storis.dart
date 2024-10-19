import 'package:flutter/material.dart';

class hompagestoris extends StatefulWidget {
  const hompagestoris({super.key});

  @override
  State<hompagestoris> createState() => _hompagestorisState();
}

class _hompagestorisState extends State<hompagestoris> {
  List storiys = [
    a(
      rasm: "images/1.jpg",
      nom: "Rengo_ku",
    ),
    a(
      rasm: "images/2.jpg",
      nom: "tan_jiro",
    ),
    a(
      rasm: "images/59.jpg",
      nom: "Rizo_chik",
    ),
    a(
      rasm: "images/60.jpg",
      nom: "ayup_mod",
    ),
    a(
      rasm: "images/61.jpg",
      nom: "ron_jiro",
    ),
    a(
      rasm: "images/62.jpg",
      nom: "maymun_jiro",
    ),
    a(
      rasm: "images/63.jpg",
      nom: "oltin_tosh",
    ),
    a(
      rasm: "images/64.jpg",
      nom: "tan_siru",
    ),
    a(
      rasm: "images/65.jpg",
      nom: "tan_miku",
    ),
    a(
      rasm: "images/66.jpg",
      nom: "gaabi_jiro",
    ),
  ];

  Widget temp(a) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,left: 12),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        a.rasm,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    border: Border.all(color: Colors.white, width: 3)),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.purple],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight
                  ),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
          Text(a.nom,style: TextStyle(fontWeight: FontWeight.w600),)
        ],
      ),
    )
    ;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
            children: storiys
                .map(
                  (e) => temp(e),
                )
                .toList()));
  }
}

class a {
  String? rasm;
  String? nom;
  a({this.nom, this.rasm});
}
