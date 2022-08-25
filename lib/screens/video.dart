// import 'package:bank/utlies/app_colors.dart';
// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoScreen extends StatefulWidget {
//   static final routeName = "videoScreen";
//
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }
//
// class _VideoScreenState extends State<VideoScreen> {
//   String dataSource = "assets/videos/first_compressed.mp4";
//   VideoPlayerController _controller;
//
//   bool _muted = false;
//   bool isFullScreen = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = VideoPlayerController.asset("assets/videos/first_compressed.mp4")
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Explanation video of the application".tr(),
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontFamily: "Segoe UI",
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: AppColors.MAIN_COLOR,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 color: Colors.grey,
//               ),
//             ),
//             Container(
//               height: 100,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//
//                         },
//                         child: Container(
//                           padding: EdgeInsets.only(left: 20, right: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 child: Icon(
//                                   Icons.repeat,
//                                   color: AppColors.MAIN_COLOR,
//                                   size: 30.0,
//                                 ),
//                                 // width: 29,
//                                 // height: 43,
//                               ),
//                               SizedBox(height: 5,),
//                               Text(
//                                 "Repeat".tr(),
//                                 style: TextStyle(
//                                     color: AppColors.MAIN_COLOR,
//                                     fontSize: 20,
//                                     fontFamily: "Segoe UI",
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.only(left: 20, right: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 child: Icon(
//                                   Icons.close,
//                                   color: AppColors.MAIN_COLOR,
//                                   size: 30.0,
//                                 ),
//                                 // width: 29,
//                                 // height: 43,
//                               ),
//                               SizedBox(height: 5,),
//                               Text(
//                                 "Close".tr(),
//                                 style: TextStyle(
//                                     color: AppColors.MAIN_COLOR,
//                                     fontSize: 20,
//                                     fontFamily: "Segoe UI",
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
