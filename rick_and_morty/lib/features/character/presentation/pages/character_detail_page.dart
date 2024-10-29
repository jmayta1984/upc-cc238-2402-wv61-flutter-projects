import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/domain/character.dart';


class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage(
      {super.key,
      required this.character,
      required this.delete,
      required this.insert});
  final Character character;
  final Function(int) delete;
  final Function(Character) insert;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: height * 0.40,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.character.id,
                    child: Image.network(
                      height: height * 0.40,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      widget.character.image,
                    ),
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Text(widget.character.name),
              IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      widget.character.isFavorite =
                          !widget.character.isFavorite;
                    });
                    widget.character.isFavorite
                        ?widget.insert(widget.character):widget.delete(widget.character.id);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color:
                        widget.character.isFavorite ? Colors.red : Colors.grey,
                  )),
            ],
          )),
    );
  }
}
