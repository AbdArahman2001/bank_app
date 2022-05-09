import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:bank_app_flutter/video_package/widget/orientation/video_player_both_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../main.dart';
import 'package:video_player/video_player.dart';
// import 'package:wakelock/wakelock.dart';

class PortraitLandscapePlayerPage extends StatefulWidget {
  final VideoPlayerController controller;

  const PortraitLandscapePlayerPage({
     this.controller,
  }) ;
  @override
  _PortraitLandscapePlayerPageState createState() =>
      _PortraitLandscapePlayerPageState();
}

class _PortraitLandscapePlayerPageState
    extends State<PortraitLandscapePlayerPage> {



  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.MAIN_COLOR,
        appBar: AppBar(toolbarHeight: 0),
        // body: VideoPlayerBothWidget(controller: widget.controller),
      );
}
