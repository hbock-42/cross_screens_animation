import 'package:flutter/material.dart';

class ProfilesPage extends StatefulWidget {

  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView(
        children: [
          SingleProfile(),
          SingleProfile(),
          SingleProfile(),
          SingleProfile(),
          SingleProfile(),
        ],
      ),
    );
  }
}

class SingleProfile extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}