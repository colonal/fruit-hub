import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId != null) {
      final data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> collection = firestore.collection(path);

      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var desc = query['desc'];
          collection = collection.orderBy(orderByField, descending: desc);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          collection = collection.limit(limit);
        }
      }
      final data = await collection.get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
