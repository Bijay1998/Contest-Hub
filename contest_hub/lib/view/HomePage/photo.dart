import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contest_hub/view/HomePage/detailContest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoContest extends StatefulWidget {
  @override
  State<PhotoContest> createState() => _PhotoContestState();
}

class _PhotoContestState extends State<PhotoContest> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Photo').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Photo Contest"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return Column(children: [
                    InkWell(
                      child: Container(
                        height: 300,
                        width: 500,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                // Icon(Icons.punch_clock),

                                Expanded(
                                  child: Center(
                                    child: Text(
                                      data['Title'],
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 411,
                                    decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                      image: new NetworkImage(
                                          "https://image.shutterstock.com/image-photo/patan-ancient-city-kathmandu-valley-260nw-1137140381.jpg"),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.business,
                                    color: Colors.red,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    data["About Organizer"],
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      data['Deadline'],
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(() => DetailPage());
                      },
                    ),
                    Divider(
                      color: Colors.grey.shade800,
                      thickness: 1,
                    ),
                  ]);
                })
                .toList()
                .cast(),
          );
        },
      ),
    );
  }
}
