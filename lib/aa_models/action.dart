import 'package:flutter_carplay/models/common/image_tint.dart';
import 'package:uuid/uuid.dart';

class AAAction {
  final String _elementId;

  final String? title;
  final String? imageUrl;
  final AutoImageTint? imageTint;
  final void Function()? onPress;

  AAAction({
    this.title,
    this.imageUrl,
    this.imageTint,
    this.onPress,
    String? id,
  })  : assert(
          title != null || imageUrl != null,
          'AAAction requires a title or imageUrl',
        ),
        _elementId = id ?? const Uuid().v4();

  String get uniqueId => _elementId;

  Map<String, dynamic> toJson() => {
        '_elementId': _elementId,
        'title': title,
        'imageUrl': imageUrl,
        'imageTint': imageTint?.toJson(),
        'onPress': onPress != null,
      };
}
