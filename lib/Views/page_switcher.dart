import 'package:flutter/material.dart';
import 'package:inter_screen_animation/Views/profile_extended_view.dart';
import 'package:inter_screen_animation/Views/profiles_view.dart';

class PageSwitcher extends StatefulWidget {
  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  bool useProfilesWidget = true;
  TransitionInfo wInfos;
  double wWidth;
  double wHeight;
  double x;
  double y;
  double imageWidth;
  double imageHeight;
  double imageX;
  double imageY;

  void _handleProfileCliked(TransitionInfo infos) {
    setState(() {
      wInfos = infos;
      wWidth = infos.size.width;
      wHeight = infos.size.height;
      x = infos.posX;
      y = infos.posY;
      imageWidth = infos.imageSize.width;
      imageHeight = infos.imageSize.height;
      imageX = infos.imagePosX;
      imageY = infos.imagePosY;
      useProfilesWidget = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget profilesWidget = ProfilesPage(
      onChanged: _handleProfileCliked,
    );

    Widget currentWidget = useProfilesWidget
        ? profilesWidget
        : SingleProfileExtended(
            posX: x,
            posY: y,
            width: wWidth,
            height: wHeight,
            imagePosX: imageX,
            imagePosY: imageY,
            imageWidth: imageWidth,
            imageHeight: imageHeight);

    return currentWidget;
  }
}
