import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/routes/app_routes.dart';
import 'package:study_app/screens/introduction/introduction.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'bindings/initial_bindings.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) ;
  InitialBindings().dependencies() ;
  runApp( const MyApp()) ;
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false ,
//     home: DataUploaderScreen(),
//   ));
// }
