import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import '../../infra/datasources/datasources.dart';

class FirebaseImageDatasource implements ImageDatasource {
  FirebaseImageDatasource({required this.storage});

  FirebaseStorage storage;

  @override
  Future<void> delete(String url) async {
    final ref = storage.refFromURL(url);
    await ref.delete();
  }

  @override
  Future<String> upload(Uint8List bytes) async {
    String uuid = '${DateTime.now().millisecondsSinceEpoch}';
    final task = storage.ref('products').child(uuid).putData(bytes);

    final upload = await task;
    final url = await upload.ref.getDownloadURL();
    return url;
  }
}
