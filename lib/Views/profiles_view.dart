import 'package:flutter/material.dart';

List<Widget> SingleProfiles;

class ProfilesPage extends StatefulWidget {
  ProfilesPage({Key key, @required this.onChanged}) : super(key: key);
  final ValueChanged<TransitionInfo> onChanged;

  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class TransitionInfo {
  int id;
  Size size;
  double posX;
  double posY;
  Size imageSize;
  double imagePosX;
  double imagePosY;

  TransitionInfo(this.id, this.posX, this.posY, this.size, this.imagePosX,
      this.imagePosY, this.imageSize);
}

class _ProfilesPageState extends State<ProfilesPage> {
  double _opacity = 1;
  int clickedId;

  SingleProfile newProfile;
  void _handleProfileCliked(TransitionInfo infos) {
    setState(() {
      clickedId = infos.id;
      _opacity = 0;
    });
    // To delay of 500 millisec
    Future.delayed(
        Duration(milliseconds: 500), () => this.widget.onChanged(infos));
  }

  @override
  Widget build(BuildContext context) {
    SingleProfiles = [
      AnimatedOpacity(
          child: SingleProfile(
            onChanged: _handleProfileCliked,
            id: 1,
          ),
          duration: Duration(milliseconds: 500),
          opacity: clickedId == 1 ? 1.0 : _opacity),
      AnimatedOpacity(
          child: SingleProfile(
            onChanged: _handleProfileCliked,
            id: 2,
          ),
          duration: Duration(milliseconds: 500),
          opacity: clickedId == 2 ? 1.0 : _opacity),
      AnimatedOpacity(
          child: SingleProfile(
            onChanged: _handleProfileCliked,
            id: 3,
          ),
          duration: Duration(milliseconds: 500),
          opacity: clickedId == 3 ? 1.0 : _opacity),
      AnimatedOpacity(
          child: SingleProfile(
            onChanged: _handleProfileCliked,
            id: 4,
          ),
          duration: Duration(milliseconds: 500),
          opacity: clickedId == 4 ? 1.0 : _opacity),
      AnimatedOpacity(
          child: SingleProfile(
            onChanged: _handleProfileCliked,
            id: 5,
          ),
          duration: Duration(milliseconds: 500),
          opacity: clickedId == 5 ? 1.0 : _opacity),
      AnimatedOpacity(
          child: SingleProfile(
            onChanged: _handleProfileCliked,
            id: 6,
          ),
          duration: Duration(milliseconds: 500),
          opacity: clickedId == 6 ? 1.0 : _opacity),
    ];
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView(
        children: SingleProfiles,
      ),
    );
  }
}

class SingleProfile extends StatefulWidget {
  SingleProfile({Key key, @required this.onChanged, @required this.id})
      : super(key: key);

  final int id;
  final ValueChanged<TransitionInfo> onChanged;

  GlobalKey gKey = GlobalKey();
  GlobalKey imageKey = GlobalKey();

  Duration duration = Duration(days: 0);
  double opacity = 1;

  @override
  _SingleProfileState createState() => _SingleProfileState();
}

class _SingleProfileState extends State<SingleProfile> {
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: this.widget.gKey,
      onTap: () =>
          _onSingleProfileWidgetTaped(this.widget.gKey, this.widget.id),
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: this.widget.duration,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.2, 0.6, 0.8],
                  colors: [
                    Color.fromRGBO(204, 0, 102, 0.8),
                    Color.fromRGBO(10, 0, 200, 0.8),
                    Color.fromRGBO(100, 45, 102, 0.8),
                  ] 
                )
              ),
              // color: Color.fromRGBO(204, 0, 102, 0.8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      key: this.widget.imageKey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/hbock.jpg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onSingleProfileWidgetTaped(GlobalKey<State<StatefulWidget>> key, int id) {
    setState(() {
      this._opacity = 1;
      final RenderBox renderBox = key.currentContext.findRenderObject();
      final RenderBox imageRenderBox =
          this.widget.imageKey.currentContext.findRenderObject();
      this.widget.onChanged(TransitionInfo(
          id,
          renderBox.localToGlobal(Offset.zero).dx,
          renderBox.localToGlobal(Offset.zero).dy - 20,
          renderBox.size,
          imageRenderBox.localToGlobal(Offset.zero).dx,
          imageRenderBox.localToGlobal(Offset.zero).dy,
          imageRenderBox.size));
    });
  }
}
