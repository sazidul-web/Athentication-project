import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMathod {
  Future adduser(String userId, Map<String, dynamic> UserinfoMap) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(UserinfoMap);
  }
}
