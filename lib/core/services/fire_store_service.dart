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
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    final user = await firestore.collection(path).doc(documentId).get();

    return user.data() ?? {};
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
