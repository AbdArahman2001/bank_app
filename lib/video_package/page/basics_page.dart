import 'package:bank_app_flutter/video_package/widget/basics/asset_player_widget.dart';
import 'package:bank_app_flutter/video_package/widget/basics/file_player_widget.dart';
import 'package:bank_app_flutter/video_package/widget/basics/network_player_widget.dart';
import 'package:bank_app_flutter/video_package/widget/other/tabbar_widget.dart';
import 'package:flutter/material.dart';

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        tabs: [
          Tab(icon: Icon(Icons.file_copy), text: 'Asset'),
          Tab(icon: Icon(Icons.attach_file), text: 'File'),
          Tab(icon: Icon(Icons.ondemand_video_outlined), text: 'Network'),
        ],
        onTap: (int value) {  },
        children: [
          buildAssets(),
          buildFiles(),
          // buildNetwork(),
        ],
      );

  Widget buildAssets() => AssetPlayerWidget();

  Widget buildFiles() => FilePlayerWidget();

  // Widget buildNetwork() => NetworkPlayerWidget();
}
