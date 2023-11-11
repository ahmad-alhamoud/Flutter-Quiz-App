import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/controllers/question_papers/questions_controller_extension.dart';
import 'package:study_app/controllers/question_papers/quiz_paper_controller.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/loading_status.dart';

import '../../models/question_paper_model.dart';

class QuestionsController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs ;
  late QuestionPaperModel questionPaperModel;
  final  allQuestions = <Questions>[].obs;
  final questionIndex = 0.obs ;
  bool get isFirstQuestion => questionIndex.value > 0 ;
  bool get isLastQuestion => questionIndex.value >= allQuestions.value.length - 1  ;
  Rxn<Questions> currentQuestion = Rxn<Questions>() ;

  Timer? _timer ;
  int remainSeconds =  1 ;
  final time = '00.00'.obs ;
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    print(_questionPaper.title);
    loadData(_questionPaper);
    super.onReady();
  }

  void loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading ;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPapersRF
              .doc(questionPaper.id)
              .collection('questions')
              .get();
      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapShot(snapshot))
          .toList();
      questionPaper.questions = questions;
      for (Questions _questions in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPapersRF
                .doc(questionPaper.id)
                .collection('questions')
                .doc(_questions.id)
                .collection('answers')
                .get();
        final answers = answersQuery.docs
            .map((answer) => Answers.fromSnapShot(answer))
            .toList();
        _questions.answers = answers;
      }

      if(questionPaper.questions !=null && questionPaper.questions!.isNotEmpty) {
        allQuestions.assignAll(questionPaper.questions!) ;
        currentQuestion.value = questionPaper.questions![0] ;
        print('...Start Timer...') ;
        _startTimer(questionPaper.timeSeconds) ;
      }else {
        loadingStatus.value = LoadingStatus.error;
      }
      loadingStatus.value = LoadingStatus.completed ;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  void selectedAnswer(String? answer){
    currentQuestion.value!.selectedAnswer = answer ;
    update(['answers_list' , 'answer_review_list']) ;
  }
 String get  completedTest{
  final answered =  allQuestions.where((element) =>
    element.selectedAnswer != null ).toList().length ;
    return "$answered out of ${allQuestions.length} answered" ;
  }

  void jumpToQuestion( int index , {bool isGoBack = true} ){
    questionIndex.value = index ;
    currentQuestion.value = allQuestions[index] ;
    if(isGoBack){
      Get.back() ;
    }
  }
  void nextQuestion(){
    if (questionIndex.value >= allQuestions.length - 1 ) return ;
    questionIndex.value++ ;
    currentQuestion.value = allQuestions[questionIndex.value] ;
  }
  void previousQuestion(){
    if(questionIndex.value <=0 ) return ;
    questionIndex.value-- ;
    currentQuestion.value = allQuestions[questionIndex.value] ;
  }
  _startTimer( int seconds){
    const duration = Duration(seconds: 1) ;
    remainSeconds = seconds ;
  _timer = Timer.periodic(duration, ( Timer timer) {
      if(remainSeconds==0) {
        timer.cancel() ;
      } else {
        int minutes  = remainSeconds ~/ 60 ;
        int seconds = remainSeconds % 60 ;
        time.value = minutes.toString().padLeft(2,'0')+ ":" +  seconds.toString().padLeft(2,"0");
        remainSeconds--;
      }
    }) ;
  }

  void complete(){
    _timer!.cancel() ;
    Get.offAndToNamed('/resultscreen') ;
  }
  void tryAgain(){
    Get.find<QuizPaperController>().navigateToQuestions(paper: questionPaperModel , tryAgain: true);
  }
 void navigateToHome(){
    _timer!.cancel() ;
    Get.offNamedUntil('/home' , (route) => false ) ;
 }

}
