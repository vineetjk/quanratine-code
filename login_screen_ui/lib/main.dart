import 'package:flutter/material.dart';
import 'Animation/FadeAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Login UI'),
    );
  }
}

Color _passEyeCol = Colors.grey;
bool _isEye = false;
bool isHidden = true;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    0.5,
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(0))),
                child: SingleChildScrollView(
                  // dragStartBehavior: DragStartBehavior.down,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                          1.1,
                          Container(
                            // padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, 0.3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                FadeAnimation(
                                  1.3,
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey[200]),
                                      ),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (_) =>
                                          FocusScope.of(context).nextFocus(),
                                      cursorColor: Colors.orange,
                                      decoration: InputDecoration(
                                          focusColor: Colors.orange,
                                          hoverColor: Colors.orange,
                                          hintText: "Email or Username",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                FadeAnimation(
                                  1.5,
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey[200]),
                                      ),
                                    ),
                                    child: TextFormField(
                                      obscureText: isHidden,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      cursorColor: Colors.orange,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hoverColor: Colors.orange,
                                        focusColor: Colors.orange,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: _passEyeCol,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isEye = !_isEye;
                                              if(_isEye == true){
                                                _passEyeCol = Colors.orange[800];
                                                isHidden = false;
                                              }else{
                                                _passEyeCol = Colors.grey;
                                                isHidden = true;
                                              }
                                            });
                                          },
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FadeAnimation(
                          1.6,
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 30),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.orange[800],
                          onPressed: () {},
                          child: FadeAnimation(
                            1.9,
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 50,
                                right: 50,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
