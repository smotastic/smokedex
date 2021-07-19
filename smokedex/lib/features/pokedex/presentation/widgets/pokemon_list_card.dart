import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';
import 'package:smokedex/features/pokedex/presentation/pages/detail_pokemon_page.dart';

class PokemonListCard extends StatelessWidget {
  final PokemonEntry entry;

  const PokemonListCard(this.entry, {Key? key}) : super(key: key);

  static final Map<String, Color> _typeColors = Map.unmodifiable({
    'bug': Color.fromRGBO(146, 188, 44, 1.0),
    'dark': Color.fromRGBO(89, 87, 97, 1.0),
    'dragon': Color.fromRGBO(12, 105, 200, 1.0),
    'electric': Color.fromRGBO(242, 217, 78, 1.0),
    'fairy': Color.fromRGBO(238, 144, 230, 1.0),
    'fighting': Color.fromRGBO(211, 66, 95, 1.0),
    'fire': Color.fromRGBO(251, 165, 76, 1.0),
    'flying': Color.fromRGBO(161, 187, 236, 1.0),
    'ghost': Color.fromRGBO(95, 109, 188, 1.0),
    'grass': Color.fromRGBO(95, 189, 88, 1.0),
    'ground': Color.fromRGBO(218, 124, 77, 1.0),
    'ice': Color.fromRGBO(117, 208, 193, 1.0),
    'normal': Color.fromRGBO(160, 162, 159, 1.0),
    'poison': Color.fromRGBO(183, 99, 207, 1.0),
    'psychic': Color.fromRGBO(250, 133, 129, 1.0),
    'rock': Color.fromRGBO(201, 187, 138, 1.0),
    'steel': Color.fromRGBO(86, 149, 163, 1.0),
    'water': Color.fromRGBO(83, 157, 223, 1.0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPokemonPage.route, arguments: entry);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // PIC + NAME
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Hero(
                      tag: entry.id,
                      child: Image.network(
                        entry.imageUrl,
                        fit: BoxFit.scaleDown,
                        height: 140,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 100,
                      // color: Colors.blueGrey[400]!,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          entry.name,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // INFOS
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                border: Border(
                    top: BorderSide(color: Colors.blueGrey[400]!, width: 2)),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.perm_identity),
                      SizedBox(
                        width: 6,
                      ),
                      Text('#${entry.id}'),
                    ],
                  ),
                  // TYPES
                  Row(
                    children: entry.types.map((type) {
                      return CircleAvatar(
                        backgroundColor: _typeColors[type],
                        child: SvgPicture.asset(
                          'assets/icons/$type.svg',
                          width: 18,
                          height: 18,
                        ),
                      );
                    }).toList(),
                  ),
                  // Row(
                  //   children: [
                  //     Icon(Icons.work),
                  //     SizedBox(
                  //       width: 6,
                  //     ),
                  //     Text(entry.types.toString()),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Icon(Icons.attach_money),
                  //     SizedBox(
                  //       width: 6,
                  //     ),
                  //     Text('Afford'),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
