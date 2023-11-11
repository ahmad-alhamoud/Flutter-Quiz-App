import 'package:get/get.dart';
import 'package:study_app/controllers/question_papers/data_uploader.dart';
import 'package:study_app/controllers/question_papers/quiz_paper_controller.dart';
import 'package:study_app/controllers/question_papers/questions_controller.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/home/login/login_screen.dart';
import 'package:study_app/screens/introduction/introduction.dart';
import 'package:study_app/screens/question/answer_check_screen.dart';
import 'package:study_app/screens/question/questions_screen.dart';
import 'package:study_app/screens/question/result_screen.dart';

import 'package:study_app/screens/splash/splash_screen.dart';

import '../screens/question/test_over_view_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionScreen(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(
          name: '/question-screen',
          page: () => const QuestionsScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuestionsController>(QuestionsController()) ;
          }),
        ),
      GetPage(name: '/testoverview', page: ()=> const  TestOverviewScreen()) ,
    GetPage(name: '/resultscreen', page: ()=> const ResultScreen()) ,
    GetPage(name: '/answercheckscreen', page: ()=> const AnswerCheckScreen())
      ];
}
