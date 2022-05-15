import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStoryScreen extends StatefulWidget {
  static const String routeName = 'videoStoryScreen';
  String video_name;
  VideoStoryScreen(this.video_name);

  @override
  _VideoStoryScreenState createState() => _VideoStoryScreenState();
}

class _VideoStoryScreenState extends State<VideoStoryScreen> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.asset('assets/videos/${widget.video_name}.mp4');

    await _videoPlayerController1.initialize();
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    // final subtitles = [
    //     Subtitle(
    //       index: 0,
    //       start: Duration.zero,
    //       end: const Duration(seconds: 10),
    //       text: 'Hello from subtitles',
    //     ),
    //     Subtitle(
    //       index: 0,
    //       start: const Duration(seconds: 10),
    //       end: const Duration(seconds: 20),
    //       text: 'Whats up? :)',
    //     ),
    //   ];
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      // allowFullScreen: true,
      looping: true,
      fullScreenByDefault: false,

      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
           // title: 'Toggle Video Src',
          ),
        ];
      },

      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),

      hideControlsTimer: const Duration(seconds: 1),
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex = currPlayIndex == 0 ? 1 : 0;
    await initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          // child: Text(
          //   "Explanation video of the application".tr(),
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 20,
          //       fontFamily: "Segoe UI",
          //       fontWeight: FontWeight.bold),
          // ),
        ),
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'.tr()),
                      ],
                    ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width / 3,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     color: Colors.grey.shade200,
          //     // image: DecorationImage(
          //     //   image: AssetImage("assets/images/okk.png"),
          //     // ),
          //   ),
          //   child: TextButton(
          //     onPressed: () {
          //       _chewieController?.enterFullScreen();
          //     },
          //     child: Text(
          //       'full screen'.tr(),
          //       style: TextStyle(
          //           color: AppColors.MAIN_COLOR,
          //           fontSize: 20,
          //           fontFamily: "Segoe UI",
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Spacer(),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _videoPlayerController1.seekTo(Duration());
                        // initializePlayer();
                        // Navigator.pop(context);
                      },
                      child: Container(
                         height: 50,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green,
                          // image: DecorationImage(
                          //   image: AssetImage("assets/images/okk.png"),
                          // ),
                        ),
                        // padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.repeat,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              // width: 29,
                              // height: 43,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Repeat".tr(),
                              style: TextStyle(
                                  // color: AppColors.MAIN_COLOR,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _videoPlayerController1.pause();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.MAIN_COLOR,
                          // image: DecorationImage(
                          //   image: AssetImage("assets/images/okk.png"),
                          // ),
                        ),
                        // padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              // width: 29,
                              // height: 43,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Close".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
