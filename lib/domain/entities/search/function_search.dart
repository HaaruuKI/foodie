import 'package:cloud_firestore/cloud_firestore.dart';

class FunctionSearch {
  static Future<void> searchFirestore(
      Function resultsSetState, String text) async {
    String startAt = text;
    String endAt = '$text\uf8ff';

    FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: startAt)
        .where('name', isLessThanOrEqualTo: endAt)
        .get()
        .then(
      (querySnapshot) {
        resultsSetState(querySnapshot);
      },
    );
  }
}
