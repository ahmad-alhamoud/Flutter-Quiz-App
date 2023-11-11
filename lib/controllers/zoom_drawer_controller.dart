import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_logger.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:url_launcher/url_launcher.dart';
class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

Rxn<User?> user = Rxn() ;
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser() ;
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle!.call();
    update();
  }

  void facebook(){
    _launch('https://www.facebook.com') ;
  }
  void signOut() {
    Get.find<AuthController>().signOut() ;
  }

  void signIn() {

  }

  void webSite() {

  }

  void email() {
    final Uri emailLaunchUri = Uri(
        scheme: 'test',
        path: 'ahmad@gmail.com'
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }

}