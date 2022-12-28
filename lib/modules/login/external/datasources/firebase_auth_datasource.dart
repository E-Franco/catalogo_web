import 'dart:convert';

import 'package:catalogo_web/modules/login/infra/datasources/auth_datasources.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class FirebaseAuthDatasource implements AuthDatasource {
  FirebaseAuthDatasource({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  Future<bool> auth(String username, String password) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('auth').doc('admin').get();
    var data = doc.data() as Map<String, dynamic>;

    List<int> passwordBytes = utf8.encode(password);
    password = sha512.convert(passwordBytes).toString();

    bool result = username == data['user'].trim().toLowerCase() && password == data['password'];
    return result;
  }
}
