import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../list/list_item.dart';
import '../template.dart';

typedef AASearchTextUpdated = void Function(
  String searchText,
  void Function(List<AAListItem> results) update,
);

class AASearchTemplate implements AATemplate {
  final String _elementId;
  final AASearchTextUpdated onUpdatedSearchText;
  final FutureOr<void> Function(
    AAListItem selectedItem,
    void Function() complete,
  )? onSelectedResult;
  final void Function(String searchText)? onSearchSubmitted;
  final String? searchHint;
  final bool isLoading;
  final bool showKeyboardByDefault;
  final List<AAListItem> _currentResults = [];

  @override
  final VoidCallback? onPop;

  AASearchTemplate({
    required this.onUpdatedSearchText,
    this.onSelectedResult,
    this.onSearchSubmitted,
    this.searchHint,
    this.isLoading = false,
    this.showKeyboardByDefault = true,
    this.onPop,
    List<AAListItem> initialResults = const [],
    String? id,
  }) : _elementId = id ?? const Uuid().v4() {
    updateResults(initialResults);
  }

  @override
  String get uniqueId => _elementId;

  List<AAListItem> get currentResults => List.unmodifiable(_currentResults);

  void updateResults(List<AAListItem> results) {
    _currentResults
      ..clear()
      ..addAll(results);
  }

  @override
  Map<String, dynamic> toJson() => {
        '_elementId': _elementId,
        'items': _currentResults.map((item) => item.toJson()).toList(),
        'searchHint': searchHint,
        'isLoading': isLoading,
        'showKeyboardByDefault': showKeyboardByDefault,
      };
}
