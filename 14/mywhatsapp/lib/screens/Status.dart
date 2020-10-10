import 'package:flutter/material.dart';
import '../reusable/Wcards.dart';
import '../model/status.dart';
import '../model/chat.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                leading: Container(
                  width: 50.0,
                  child: Stack(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          messageData[0].imageUrl,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  "My Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Tap to add status update"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text(
              "Recent updates",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: statusData.length,
            itemBuilder: (context, i) {
              return Column(
                children: <Widget>[
                  Divider(height: 0.1),
                  Wcards(statusData[i].name, statusData[i].imageUrl,
                      statusData[i].time),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 30.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text(
              "Viewed updates",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: viewData.length,
            itemBuilder: (context, i) {
              return Column(
                children: <Widget>[
                  Divider(height: 0.1),
                  Wcards(
                    viewData[i].name,
                    viewData[i].imageUrl,
                    viewData[i].time,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

// class Heading extends StatelessWidget {
//   final String heading;

//   Heading(this.heading);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: EdgeInsets.only(left: 5.0, right: 5.0),
//         child: Text(
//           heading,
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ),
//     );
//   }
// }
