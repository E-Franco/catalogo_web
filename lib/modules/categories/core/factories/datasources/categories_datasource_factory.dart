import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../external/datasources/datasources.dart';
import '../../../infra/datasources/datasources.dart';

CategoryDatasource makeCategoriesDatasource() => FirebaseCategoriesDatasource(FirebaseFirestore.instance);
