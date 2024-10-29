import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty/core/app_constants.dart';
import 'package:rick_and_morty/features/character/data/repository/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/character.dart';
import 'package:rick_and_morty/features/character/presentation/pages/character_detail_page.dart';
import 'package:rick_and_morty/features/character/presentation/widgets/character_list_item.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key, required this.characterRepository});
  final CharacterRepository characterRepository;

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final PagingController<int, Character> _pagingController =
      PagingController(firstPageKey: AppConstants.initialPage);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await widget.characterRepository.getCharacters(pageKey);
      final isLastPage = newItems.length < AppConstants.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        _pagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) {
        _fetchPage(pageKey);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Character>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Character>(
        itemBuilder: (context, item, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetailPage(character: item, delete: (id) {
                            widget.characterRepository.delete( id);
                          }, insert: (character) {
                            widget.characterRepository.insert(character);
                          },),
                    ));
              },
              child: CharacterListItem(character: item));
        },
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
