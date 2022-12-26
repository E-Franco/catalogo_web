import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../external/datasources/datasources.dart';
import '../../../infra/datasources/datasources.dart';

SubCategoryDatasource makeSubCategoriesDatasource() => FirebaseSubCategoriesDatasource(FirebaseFirestore.instance);
