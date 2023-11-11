import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
final userRF = FirebaseFirestore.instance.collection('users') ;
final questionPapersRF = fireStore.collection('questionPapers');
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPapersRF.doc(paperId).collection('questions').doc(questionId);
Reference get firebaseStorage => FirebaseStorage.instance.ref();

