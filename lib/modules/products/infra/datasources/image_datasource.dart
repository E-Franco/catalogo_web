import 'package:flutter/foundation.dart';

abstract class ImageDatasource {
  Future<String> upload(Uint8List bytes);
  Future<void> delete(String url);
}
