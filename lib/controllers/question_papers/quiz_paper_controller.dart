import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_logger.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/screens/question/questions_screen.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class QuizPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPapersRF.get();
    final paperList =  data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();

    allPapers.assignAll(paperList);
      for (var paper in paperList ) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
            paper.imageUrl =  imgUrl;
      }
      allPapers.assignAll(paperList) ;
    } catch (e) {
      print('error here') ;
      AppLogger.e(e) ;
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper , bool tryAgain= false }){
    AuthController _authController = Get.find() ;
    if(_authController.isLoggedIn()) {
      if(tryAgain){
          Get.back() ;
          Get.toNamed(QuestionsScreen.routeName , arguments: paper , preventDuplicates: false) ;
      }
      else {
        print('User Authenticated') ;
        Get.toNamed(QuestionsScreen.routeName , arguments: paper) ;
      }
    }else {
      _authController.showLoginAlertDialogue() ;
    }
  }
}
