import 'package:flutter/material.dart';

List<Widget> SingleProfiles;

class ProfilesPage extends StatefulWidget {
  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {

  @override
  Widget build(BuildContext context) {
    SingleProfiles = [
      SingleProfile(),
      SingleProfile(),
      SingleProfile(),
      SingleProfile(),
      SingleProfile(),
    ];
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView(
        children: SingleProfiles,
      ),
    );
  }
}

enum WidgetVisibilty { Visible, FadingOut, FadingIn, Hidden }

class SingleProfile extends StatefulWidget {
  GlobalKey gKey = GlobalKey();
  WidgetVisibilty visibility = WidgetVisibilty.Hidden;
  Duration duration = Duration(days: 0);
  double opacity = 1;

  @override
  _SingleProfileState createState() => _SingleProfileState();
}

class _SingleProfileState extends State<SingleProfile> {

  Offset size() {
      final RenderBox renderBox = this.widget.gKey.currentContext.findRenderObject();
      return renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    this.widget.visibility = WidgetVisibilty.Visible;
    return GestureDetector(
      key: this.widget.gKey,
      onTap: () => _onSingleProfileWidgetTaped(this.widget.gKey),
      child: AnimatedOpacity(
        opacity: this.widget.opacity,
        duration: this.widget.duration,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: Container(
            color: Color.fromRGBO(0, 0, 255, 0.8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/hbock.jpg',
                    width: 80,
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSingleProfileWidgetTaped(GlobalKey<State<StatefulWidget>> key) {
    setState(() {
      final RenderBox renderBox = key.currentContext.findRenderObject();
      for (var profiles in SingleProfiles) {
        var p = profiles as SingleProfile;
        if (p.gKey == key) {
          if (p.visibility == WidgetVisibilty.Visible) {
            p.duration = Duration(milliseconds: 500);
            // todo create new widget
          }
        } else {
          p.duration = Duration(milliseconds: 500);
        }
        p.opacity = 0;
        print(renderBox.localToGlobal(Offset.zero));
      }
    });
  }
}
