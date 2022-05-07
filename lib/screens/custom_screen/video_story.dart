// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class VideoStoryScreen extends StatefulWidget {
//   static const String routeName = 'videoStoryScreen';
//
//   @override
//   _VideoStoryScreenState createState() => _VideoStoryScreenState();
// }
//
// class _VideoStoryScreenState extends State<VideoStoryScreen> {
//   final storiesController = Get.put(StoriesController());
//   String dataSource = "assets/videos/first_compressed.mp4";
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   double _volume = 100;
//   bool _muted = false;
//   bool isFullScreen = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = VideoPlayerController.asset("assets/videos/${storiesController.story.value.video}.mp4")
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
//   @override
//   Widget build(BuildContext context) {
//     isFullScreen = false;
//     // if(MediaQuery.of(context).orientation == Orientation.landscape){
//     //   print("land scape");
//     //   Future.delayed(
//     //       Duration.zero,
//     //           () =>showDialog(
//     //       context: context, barrierColor: AppColors
//     //       .MAIN_COLOR, builder: (BuildContext context) {
//     //     return PortraitLandscapePlayerPage(
//     //         controller: _controller);
//     //   })
//     //   );
//     // }
//     return MediaQuery.of(context).orientation == Orientation.landscape? PortraitLandscapePlayerPage(
//         controller: _controller) : GetX<StoriesController>(
//         builder: (controller) {
//           return Scaffold(
//             backgroundColor: AppColors.MAIN_COLOR,
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               backgroundColor: AppColors.MAIN_COLOR,
//               title: Center(
//                 child: FittedBox(
//                   fit: BoxFit.fitWidth,
//                   child: Text(
//                     controller.story.value.title.toString(),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontFamily: "Segoe UI",
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               elevation: 0,
//               // actions: [
//               //   IconButton(
//               //     icon: Icon(Icons.arrow_forward),
//               //     onPressed: () {
//               //       Navigator.pop(context);
//               //     },
//               //   ),
//               // ],
//             ),
//             body: Container(
//               padding: EdgeInsets.only(left: 16, right: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // check the video is loaded
//                   _controller.value.isInitialized
//                       ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   )
//                       : GestureDetector(
//                     onTap: (){
//                       _controller = VideoPlayerController.asset("assets/videos/${storiesController.story.value.video}.mp4")
//                         ..initialize().then((_) {
//                           setState(() {});
//                         });
//                       _controller.play();
//                     },
//                         child: Container(
//                     color: Colors.black,
//                     width: MediaQuery
//                           .of(context)
//                           .size
//                           .width,
//                     height: 200,
//                     child: Center(
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CircularProgressIndicator(),
//                               Text(
//                                 "اضغط لتشغيل الفيديو",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontFamily: "Segoe UI",
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ]),
//                     ),
//                   ),
//                       ),
//                   // lets add a video progress indicator
//                   VideoProgressIndicator(
//                     _controller,
//                     allowScrubbing: true,
//                     padding: EdgeInsets.all(0),
//                   ),
//                   // SizedBox(height: 5,),
//                   // create the buttom controller
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       // IconButton(
//                       //   icon: const Icon(Icons.skip_previous),
//                       //   onPressed: _controller.value.isPlaying
//                       //       ? () => _controller.load(_ids[
//                       //   (_ids.indexOf(_controller.metadata.videoId) -
//                       //       1) %
//                       //       _ids.length])
//                       //       : null,
//                       // ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.stop,
//                         ),
//                         onPressed: () {
//                           _controller.pause();
//                           _controller.seekTo(Duration(seconds: 0));
//                           setState(() {});
//                         }
//                         ,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying
//                               ? Icons.pause
//                               : Icons.play_arrow,
//                         ),
//                         onPressed: () {
//                           _controller.value.isPlaying
//                               ? _controller.pause()
//                               : _controller.play();
//                           setState(() {});
//                         }
//                         ,
//                       ),
//                       IconButton(
//                         icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
//                         onPressed: () {
//                           _muted
//                               ? _controller.setVolume(1.0)
//                               : _controller.setVolume(0);
//                           setState(() {
//                             _muted = !_muted;
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(isFullScreen
//                             ? Icons.fullscreen_exit
//                             : Icons.fullscreen),
//
//                         onPressed: () {
//                           isFullScreen
//                               ? null
//                               : showDialog(
//                               context: context, barrierColor: AppColors
//                               .MAIN_COLOR, builder: (BuildContext context) {
//                             return PortraitLandscapePlayerPage(
//                                 controller: _controller);
//                           });
//                           setState(() {
//                             isFullScreen = !isFullScreen;
//                           });
//                         },
//                       ),
//                       // FullScreenButton(
//                       //   controller: _controller,
//                       //   color: Colors.black,
//                       // ),
//                       // IconButton(
//                       //   icon: const Icon(Icons.skip_next),
//                       //   onPressed: _controller.value.isPlaying
//                       //       ? () => _controller.load(_ids[
//                       //   (_ids.indexOf(_controller.metadata.videoId) +
//                       //       1) %
//                       //       _ids.length])
//                       //       : null,
//                       // ),
//                     ],
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     IconButton(
//                   //       onPressed: () {},
//                   //       icon: Icon(Icons.skip_previous),
//                   //       color: Colors.white,
//                   //     ),
//                   //     IconButton(
//                   //       onPressed: () {
//                   //         print(_controller.value.isPlaying);
//                   //         _controller.value.isPlaying
//                   //             ? _controller.pause()
//                   //             : _controller.play();
//                   //       },
//                   //       icon: Icon(Icons.play_arrow),
//                   //       color: Colors.white,
//                   //     ),
//                   //     IconButton(
//                   //       onPressed: () {},
//                   //       icon: Icon(Icons.skip_next),
//                   //       color: Colors.white,
//                   //     ),
//                   //   ],
//                   // ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: GridView(
//                       shrinkWrap: true,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 40,
//                       ),
//                       children: [
//                         AppStackHome(
//                           isLocked: false,
//                           changeScreen: () {
//                             if (_controller.value.isPlaying) _controller
//                                 .pause();
//                             setState(() {});
//                             Navigator.pushNamed(
//                               context,
//                               MeaningsScreen.routeName,
//                             );
//                           },
//                           image: Image.asset(
//                             'assets/images/meaning.png',
//                             // width: 175,
//                             // height: 164,
//                           ),
//                         ),
//                         AppStackHome(
//                           isLocked: false,
//                           changeScreen: () {
//                             if (_controller.value.isPlaying) _controller
//                                 .pause();
//                             setState(() {});
//                             Navigator.pushNamed(
//                               context,
//                               OppositeScreen.routeName,
//                             );
//                           },
//                           image: Image.asset(
//                             'assets/images/opposite.png',
//                           ),
//                         ),
//                         AppStackHome(
//                           isLocked: false,
//                           changeScreen: () {
//                             if (_controller.value.isPlaying) _controller
//                                 .pause();
//                             setState(() {});
//                             Navigator.pushNamed(
//                               context,
//                               OneThingsScreen.routeName,
//                             );
//                           },
//                           image: Image.asset(
//                             'assets/images/one_things.png',
//                           ),
//                         ),
//                         AppStackHome(
//                           isLocked: false,
//                           changeScreen: () {
//                             if (_controller.value.isPlaying) _controller
//                                 .pause();
//                             setState(() {});
//                             Navigator.pushNamed(
//                               context,
//                               QuestionsNofakerScreen.routeName,
//                             );
//                           },
//                           image: Image.asset(
//                             'assets/images/question_nofaker.png',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//     );
//   }
// }
