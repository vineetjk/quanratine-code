import 'package:flutter/material.dart';
import 'EventItem.dart';
import 'Animations/FadeAnimatioon.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black, ),
        
        
        actions: <Widget>[
          
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/event1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                  offset: Offset(15, -15),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white),
                        shape: BoxShape.circle,
                        color: Colors.yellow[800]),
                  )),
            ),
          )
        ],
      ),
      drawer: Drawer(
        
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search Event",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                makeItem(
                  image: 'https://picsum.photos/250?image=9',
                  date: 17,
                  month: "SEP",
                  name: "Bumbershoot 2019",
                  time: "19:00 PM",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.3,
                makeItem(
                  image: 'https://picsum.photos/250?image=9',
                  date: 17,
                  month: "SEP",
                  name: "Bumbershoot 2019",
                  time: "19:00 PM",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
