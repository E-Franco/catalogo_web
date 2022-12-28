import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../external/datasources/firebase_auth_datasource.dart';
import '../../../infra/datasources/auth_datasources.dart';

AuthDatasource makeAuthDatasource() => FirebaseAuthDatasource(firestore: FirebaseFirestore.instance);