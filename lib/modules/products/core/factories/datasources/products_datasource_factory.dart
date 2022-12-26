import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../external/datasources/datasources.dart';
import '../../../infra/datasources/datasources.dart';

ProductDatasource makeProductsDatasource() => FirebaseProductsDatasource(FirebaseFirestore.instance);