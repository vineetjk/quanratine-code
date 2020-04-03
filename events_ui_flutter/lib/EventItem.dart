import 'package:flutter/material.dart';

Widget makeItem({name, image, time, date, month}) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 15),
          child: Column(
            children: <Widget>[
              Text(
                date.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                month.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    name.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        time.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
}