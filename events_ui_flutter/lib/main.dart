import 'package:events_ui_flutter/Animations/FadeAnimatioon.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'EventsList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Events'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(context, PageTransition(child: EventList(), type: PageTransitionType.fade));

            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/fireimage.png'),
          fit: BoxFit.cover,
        )),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             FadeAnimation(1, Text(
                "Find the best locations near you for a good night.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),),
              
              SizedBox(
                height: 30,
              ),
             FadeAnimation(1.3, Text(
                "Let us find you an event for your interest",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 25,
                  fontWeight: FontWeight.w100,
                ),
              ),),
              SizedBox(
                height: 150,
              ),
             FadeAnimation(1.4, InkWell(
                onTap: () {
                  setState(() {
                    hide = true;
                  });
                  _scaleController.forward();
                },
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) => Transform.scale(
                    scale: _scaleAnimation.value,
                  
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.yellow[700],
                    ),
                    child: hide == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                             FadeAnimation(1.6 ,Text(
                                "Find nearest event",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),),
                             FadeAnimation(1.7, Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),),
                            ],
                          )
                        : Container(),
                  ),),
                ),
              ),),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
