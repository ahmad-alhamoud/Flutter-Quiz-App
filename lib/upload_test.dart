// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:study_app/controllers/question_papers/data_uploader.dart';
// import 'package:study_app/loading_status.dart';
//
// class UploadProgress extends StatelessWidget {
//   const UploadProgress({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//           ()=> Center(
//           child: Get.find<DataUploader>().loadingStatus.value == LoadingStatus.loading ? CircularProgressIndicator() : Text('Upload Done'),
//         ),
//       ),
//     );
//   }
// }
