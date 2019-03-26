import 'package:flutter/material.dart';

class SingleProfileExtended extends StatefulWidget {
  double posX;
  double posY;
  double width;
  double height;
  double imagePosX;
  double imagePosY;
  double imageWidth;
  double imageHeight;

  SingleProfileExtended(
      {Key key,
      this.posX,
      this.posY,
      this.width,
      this.height,
      this.imagePosX,
      this.imagePosY,
      this.imageWidth,
      this.imageHeight})
      : super(key: key);

  @override
  SingleProfileExtendedState createState() => SingleProfileExtendedState();
}

class SingleProfileExtendedState extends State<SingleProfileExtended>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation<double> _lateAnimation;
  Animation<BorderRadius> borderRadius;
  Animation<BorderRadius> imageBorderRadius;
  Animation<Color> color;
  Animation<Color> color1;
  Animation<Color> color2;
  Animation<Color> color3;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    void handler(status) {
      if (status == AnimationStatus.completed) {
        _animation.removeStatusListener(handler);
        _lateAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(
              0.2,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));
        _controller.forward();
      }
    }

    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ))
      ..addStatusListener(handler);

    borderRadius = BorderRadiusTween(
            begin: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    imageBorderRadius = BorderRadiusTween(
            begin: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            end: BorderRadius.circular(40.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    color = ColorTween(
            begin: Color.fromRGBO(204, 0, 102, 0.8),
            end: Color.fromRGBO(102, 153, 153, 0.8))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    color1 = ColorTween(
            begin: Color.fromRGBO(204, 0, 102, 0.8),
            end: Color.fromRGBO(204, 0, 102, 0.8))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    color2 = ColorTween(
            begin: Color.fromRGBO(204, 0, 102, 0.8),
            end: Color.fromRGBO(100, 45, 102, 0.8))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    color3 = ColorTween(
            begin: Color.fromRGBO(133, 0, 67, 0.8),
            end: Color.fromRGBO(247, 230, 34, 0.8))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeigth = MediaQuery.of(context).size.height;
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Stack(
            children: <Widget>[
              Positioned(
                  left: this.widget.posX * _animation.value,
                  top: this.widget.posY * _animation.value,
                  width: (this.widget.width * _animation.value) +
                      ((1 - _animation.value) * screenWidth),
                  height: (this.widget.height * _animation.value) +
                      ((1 - _animation.value) * screenHeigth + 20),
                  child: ClipRRect(
                    borderRadius: borderRadius.value,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  stops: [
                                0.2,
                                0.2 * _animation.value +
                                    (1 - _animation.value) * 0.5,
                                0.8
                              ],
                                  colors: [
                                color1.value,
                                color2.value,
                                color3.value,
                              ])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: (1 - _animation.value) *
                                      (screenWidth * 0.5 - 40),
                                  top:
                                      (((1 - _animation.value) * screenHeigth) *
                                                  0.5) *
                                              _animation.value +
                                          ((1 - _animation.value) * 30),
                                  child: ClipRRect(
                                    borderRadius: imageBorderRadius.value,
                                    child: Image.asset(
                                      'assets/images/hbock.jpg',
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ))
            ],
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
