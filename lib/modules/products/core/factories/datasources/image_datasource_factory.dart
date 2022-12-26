import 'package:firebase_storage/firebase_storage.dart';

import '../../../external/datasources/datasources.dart';
import '../../../infra/datasources/datasources.dart';

ImageDatasource makeImageDatasource() => FirebaseImageDatasource(storage: FirebaseStorage.instance);