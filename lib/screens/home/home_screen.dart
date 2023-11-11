import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';

import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/screens/home/menu_screen.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/content_area.dart';

import '../../configs/themes/app_icons.dart';
import '../../controllers/question_papers/quiz_paper_controller.dart';
import '../../widgets/app_circle_button.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizPaperController _questionPaperController = Get.find() ;
    return Scaffold(
      body:  ZoomDrawer(
          borderRadius: 50.0 ,
          controller: controller.zoomDrawerController,
          angle: 0.0,
          menuScreenWidth: double.maxFinite,
          style: DrawerStyle.defaultStyle,
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          menuScreen: MyMenuScreen(),
          mainScreen: Container(
              decoration: BoxDecoration(
                  gradient: mainGradient()
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Icon(
                                AppIcons.menuLeft
                            ),
                            onTap: controller.toogleDrawer,
                          ) ,
                          const SizedBox(
                            height: 10,
                          ) ,
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10) ,
                            child: Row(
                              children: [
                                const Icon(AppIcons.peace,) ,
                                Text(
                                  "Hello friend" ,
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor
                                  ),
                                )
                              ],
                            ),
                          ) ,
                          Text(
                            "What do you want to learn today?" ,
                            style: headerText,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(
                                ()=> ListView.separated(
                                padding: UIParameters.mobileScreenPadding,
                                itemBuilder: (BuildContext context , int  index) {
                                  return QuestionCard(model: _questionPaperController.allPapers[index],) ;
                                },
                                separatorBuilder : (BuildContext context, int  index ){
                                  return SizedBox(
                                    height: 20,
                                  ) ;
                                },
                                itemCount: _questionPaperController.allPapers.length),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
    );
  }
}
