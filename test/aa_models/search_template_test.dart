import 'package:flutter_carplay/flutter_carplay.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('serializes Android Auto search configuration and results', () {
    final template = AASearchTemplate(
      id: 'search',
      initialResults: [AAListItem(id: 'vehicle', title: 'B-AB 1234')],
      onUpdatedSearchText: (_, __) {},
      searchHint: 'Search vehicle',
    );

    expect(template.toJson(), {
      '_elementId': 'search',
      'items': [
        {
          '_elementId': 'vehicle',
          'title': 'B-AB 1234',
          'subtitle': null,
          'imageUrl': null,
          'imageTint': null,
          'trailingImage': null,
          'trailingImageTint': null,
          'loadingMessage': null,
          'isBrowsable': null,
          'toggle': null,
          'onPress': false,
        },
      ],
      'searchHint': 'Search vehicle',
      'isLoading': false,
      'showKeyboardByDefault': true,
    });
  });

  test('updates the selectable search results', () {
    final template = AASearchTemplate(onUpdatedSearchText: (_, __) {});
    final result = AAListItem(title: 'B-CD 5678');

    template.updateResults([result]);

    expect(template.currentResults, [result]);
  });
}
