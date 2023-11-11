import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/widgets/common/main_button.dart';

import '../../../controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController>{
  const LoginScreen({Key? key}) : super(key: key);

  static const String routName = '/login' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient() ,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_splash_logo.png' , width: 200,height: 200,) ,
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 60,),
              child: Text(
                'This is a study app , you can use as you want. You have the full access to all the materials in this course ' ,
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold ,
                ),
                textAlign: TextAlign.center,
              ),
            ) ,
            MainButton(
              onTap: (){
                controller.signInWithGoogle() ;
              },
              child: Stack(
                children: [
                  Positioned(
                      child: SvgPicture.asset('assets/icons/google.svg') ,
                      top: 0,
                      left: 0,
                      bottom: 0,
                  ) ,
                  Center(
                    child: Text(
                      'Sign in with Google' ,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor ,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
