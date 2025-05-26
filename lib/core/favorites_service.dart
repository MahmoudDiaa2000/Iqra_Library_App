import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesService {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static String get _uid => _auth.currentUser!.uid;

  static Future<void> toggleFavorite(String bookId) async {
    final doc = _firestore.collection('users').doc(_uid);
    final ref = doc.collection('favorites').doc(bookId);
    final exists = await ref.get();

    if (exists.exists) {
      await ref.delete();
    } else {
      await ref.set({'bookId': bookId});
    }
  }

  static Future<bool> isFavorite(String bookId) async {
    final doc =
        await _firestore
            .collection('users')
            .doc(_uid)
            .collection('favorites')
            .doc(bookId)
            .get();
    return doc.exists;
  }
}
