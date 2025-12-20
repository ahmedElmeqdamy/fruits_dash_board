import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uid,
  }) async {
    final data = await firebaseFirestore.collection(path).doc(uid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isDataExit({required String path, required String uid}) async {
    final data = await firebaseFirestore.collection(path).doc(uid).get();
    return data.exists;
  }
}
