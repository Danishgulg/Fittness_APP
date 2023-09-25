import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOperations {
  final _dbInstance = FirebaseFirestore.instance;

  //add doc to firebase
  Future<void> addDocoment(
      {required String collection, required Map<String, dynamic> data}) async{
    try {
  await _dbInstance.collection(collection).add(data);
} on FirebaseException catch (e) {
  print(e);
}

  }

  //add doc to firebase
  Future<void> addDocumentById(
      {required String collection,
      required String doc,
      required Map<String, dynamic> data}) async {
    await _dbInstance.collection(collection).doc(doc).set(data);
  }

  //get the all doc from collection frebase

  Future<List<DocumentSnapshot>> getDocument(
      {required String collection}) async {
    final QuerySnapshot querySnapshot =
        await _dbInstance.collection(collection).get();
    return querySnapshot.docs;
  }

  //get the docoment of collection
  Future<DocumentSnapshot?> getDocumentById(
      {required String collection, required String doc}) async {
    final DocumentSnapshot documentSnapshot =
        await _dbInstance.collection(collection).doc(doc).get();
    return documentSnapshot;
  }

  Future<QuerySnapshot?> getDocumentInCollection(
      {required String collection,
      required String doc,
      required String collection2}) async {
    try {
      final QuerySnapshot documentsSnapshot = await _dbInstance
          .collection(collection)
          .doc(doc)
          .collection(collection2)
          .get();
      return documentsSnapshot;
    } on FirebaseException catch (e) {
      print("this is the exception : $e");
    }
    return null;
  }

  // Update a document
  Future<bool> updateDocumentData(String collection, String documentId,
      Map<String, dynamic> newData) async {
    try {
      final DocumentReference documentReference =
          _dbInstance.collection(collection).doc(documentId);
      await documentReference.update(newData);
      return documentReference.update(newData).then((_) {
        return true;
      }).catchError((error) {
        return false;
      });
    } on FirebaseException catch (e) {
      print(e);
      return false;
    }
  }

  // Delete the function
  Future<bool> deleteDocument(
      {required String collection, required String doc}) async {
    try {
      return await _dbInstance
          .collection(collection)
          .doc(doc)
          .delete()
          .then((value) => true)
          .catchError((error) {
        return false;
      });
    } catch (e) {
      return false;
    }
  }
}
