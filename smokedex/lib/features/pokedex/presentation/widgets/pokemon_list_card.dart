import 'package:flutter/material.dart';
import 'package:smokedex/features/pokedex/domain/entities/pokemon_entry.dart';

class PokemonListCard extends StatelessWidget {
  final PokemonEntry entry;

  const PokemonListCard(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    entry.imageUrl,
                    fit: BoxFit.scaleDown,
                    height: 140,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 100,
                    color: Colors.blueGrey[400]!,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
            // INFOS
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
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
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Complex'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Afford'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
