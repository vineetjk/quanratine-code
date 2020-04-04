import 'package:events_ui_flutter/Events.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'EventItem.dart';
import 'Animations/FadeAnimatioon.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Posts> postsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("object");
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("events");

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postsList.clear();
      

      for (var individualKey in KEYS) {
        print(DATA[individualKey]['name']);
        Posts posts = new Posts(
            DATA[individualKey]['name'],
            DATA[individualKey]['image'],
            DATA[individualKey]['time'],
            DATA[individualKey]['date'].toString(),
            DATA[individualKey]['month'],
        );

        postsList.add(posts);
        
      }

      setState(() {
       // print("Length: ${postsList.length}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
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
      drawer: Drawer(),
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
              SingleChildScrollView(
                  child: postsList.length == 0
                      ? Padding(
                        
                        padding: const EdgeInsets.only(top:100.0),
                        child: Column(
                          
                          children: <Widget>[

                            Center( child: CircularProgressIndicator()),
                            Padding(
                              padding: const EdgeInsets.only(top:30.0),
                              child: Text("Loading...."),
                            )
                          ],
                        ),
                      )
                      : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: postsList.length,
                          itemBuilder: (_, index) {
                            return Column(
                              children: <Widget>[
                                FadeAnimation(
                                  1.2,
                                  makeItem(
                                    image: postsList[index].image,
                                    date: postsList[index].date,
                                    month: postsList[index].month,
                                    name: postsList[index].name,
                                    time: postsList[index].time,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          })),
              
            ],
          ),
        ),
      ),
    );
  }
}
