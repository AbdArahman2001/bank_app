import 'package:bank_app_flutter/video_package/widget/orientation/landscape_player_page.dart';
import 'package:bank_app_flutter/video_package/widget/orientation/portrait_player_widget.dart';
import 'package:bank_app_flutter/video_package/widget/other/tabbar_widget.dart';
import 'package:flutter/material.dart';

class OrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        onTap: (index) {
          switch (index) {
            case 1:
              goToLandscape(context);
              break;
            case 2:
              goToLandscape(context);
              break;
          }
        },
        tabs: [
          Tab(icon: Icon(Icons.screen_lock_portrait), text: 'Portrait'),
          Tab(icon: Icon(Icons.screen_lock_landscape), text: 'Landscape'),
          Tab(icon: Icon(Icons.screen_rotation), text: 'Both'),
        ],
        children: [
          buildPortrait(),
          buildLandscape(context),
          buildPortraitAndLandscape(context),
        ],
      );

  Widget buildPortrait() => PortraitPlayerWidget();

  Widget buildLandscape(BuildContext context) => buildButton(
        text: 'Back To Landscape',
        onClicked: () => goToLandscape(context),
      );

  Widget buildPortraitAndLandscape(BuildContext context) => buildButton(
        text: 'Back To Both',
        onClicked: () => goToLandscape(context),
      );

  Widget buildButton({
     String text,
     VoidCallback onClicked,
  }) =>
      Center(
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          onPressed: onClicked,
        ),
      );

  void goToLandscape(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LandscapePlayerPage()));

  // void goToPortraitAndLandscape(BuildContext context) =>
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => PortraitLandscapePlayerPage()));
}
