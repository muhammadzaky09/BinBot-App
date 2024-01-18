import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreRetrieval {
  var db = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  Future<double> getWalletAmount() async {
    var doc = await db.collection('user_data').doc(userId).get();
    if (!doc.exists) {
      throw Exception('User data not found');
    }
    return doc.data()?['wallet_amount']?.toDouble() ?? 0.0;
  }

  Future<double> getTotalRecycled() async {
    var doc = await db.collection('user_data').doc(userId).get();
    if (!doc.exists) {
      throw Exception('User data not found');
    }
    return doc.data()?['trash_amount']?.toDouble() ?? 0.0;
  }

  Future<int> getRecpoints() async {
    var doc = await db.collection('user_data').doc(userId).get();
    if (!doc.exists) {
      throw Exception('User data not found');
    }
    return doc.data()?['recpoints']?.toInt() ?? 0;
  }
}
