import 'package:contest_hub/provider/writedataProvider.dart';
import 'package:contest_hub/view/HomePage/photo.dart';
import 'package:contest_hub/view/bottomNavigation.dart';
import 'package:contest_hub/view/OrganizePage/homePage.dart';
import 'package:contest_hub/view/quiz/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class OrganizeEventPage extends StatefulWidget {
  OrganizeEventPage({Key? key}) : super(key: key);

  @override
  State<OrganizeEventPage> createState() => _OrganizeEventPageState();
}

class _OrganizeEventPageState extends State<OrganizeEventPage> {
  String item = "Select";

  DateTime date = DateTime(2000, 10, 10);

  final _form = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final contestDescriptionController = TextEditingController();
  final deadlineController = TextEditingController();
  final aboutOrganizerController = TextEditingController();
  final organizerNameController = TextEditingController();
  final locationController = TextEditingController();

  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: ((context, ref, child) {
          return Form(
            key: _form,
            child: ListView(
              children: [
                // Container(
                //   color: Colors.grey,
                //   height: 700,
                //   width: 450,
                // ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Contest Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Title of Contest",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 10,
                          controller: titleController,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "No value ";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              hintText: "Enter title of Contest",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Contest Description",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 10,
                          controller: contestDescriptionController,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "No value";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              hintText: "Enter Description of Contest",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("Organizer's Name",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 10,
                          controller: organizerNameController,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "null";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              hintText: "Enter your Organizer Name",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("About Organizer",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 10,
                          controller: aboutOrganizerController,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "null";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              hintText: "Enter about your company/organization",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("Location Requirement",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                            "(if any)",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 10,
                          controller: locationController,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "null";
                            } else {
                              return null;
                            }
                          }),
                          decoration: InputDecoration(
                              hintText: "Enter location requirement",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Feature Photo",
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(
                                  "*",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 35,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Icon(
                                  Icons.image,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Deadline",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(children: [
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Icon(Icons.calendar_month,
                                        color: Colors.red),
                                    onTap: () async {
                                      DateTime? datetime = await showDatePicker(
                                        context: context,
                                        initialDate: date,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2030),
                                      );

                                      if (datetime == null) {
                                        return;
                                      } else {
                                        setState(() {
                                          date = datetime;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${date.year}/${date.month}/${date.day}",
                                    style:
                                        TextStyle(color: Colors.grey.shade800),
                                  ),
                                ],
                              ),
                            )
                          ]),
                          const SizedBox(
                            width: 80,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: DropdownButton(
                                      icon: Visibility(
                                          visible: false,
                                          child: Icon(Icons.arrow_downward)),
                                      value: item,
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text("Select"),
                                          value: "Select",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Photo Contest"),
                                          value: "Photo Contest",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Writing Contest"),
                                          value: "Writing Contest",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Quiz Contest"),
                                          value: "Quiz Contest",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("GiveAways"),
                                          value: "GiveAways",
                                        )
                                      ],
                                      onChanged: (val) {
                                        setState(() {
                                          item = val.toString();
                                        });
                                      }),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                Center(
                  child: InkWell(
                      child: Container(
                        height: 30,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () async {
                        _form.currentState!.save();
                        if (_form.currentState!.validate()) {
                          if (item == "Photo Contest") {
                            final response = await ref.read(crudprovider).photo(
                                titleController.text.trim(),
                                contestDescriptionController.text.trim(),
                                date.toString(),
                                item,
                                aboutOrganizerController.text.trim(),
                                organizerNameController.text.trim(),
                                locationController.text.trim());
                            if (response != "Success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('$response')));
                            } else {
                              Get.to(() => Quiz());
                            }
                          } else if (item == "Writing Contest") {
                            final response = await ref
                                .read(crudprovider)
                                .writing(
                                    titleController.text.trim(),
                                    contestDescriptionController.text.trim(),
                                    date.year.toString(),
                                    item,
                                    aboutOrganizerController.text.trim());
                            if (response != "Success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('$response')));
                            } else {
                              Get.to(() => BottomNavigationPage());
                            }
                          } else if (item == "Quiz Contest") {
                            final response = await ref.read(crudprovider).quiz(
                                titleController.text.trim(),
                                contestDescriptionController.text.trim(),
                                date.year.toString(),
                                item,
                                aboutOrganizerController.text.trim());
                            if (response != "Success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('$response')));
                            } else {
                              Get.to(() => BottomNavigationPage());
                            }
                          } else {
                            final response = await ref
                                .read(crudprovider)
                                .giveaways(
                                    titleController.text.trim(),
                                    contestDescriptionController.text.trim(),
                                    date.year.toString(),
                                    item,
                                    aboutOrganizerController.text.trim());
                            if (response != "Success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('$response')));
                            } else {
                              Get.to(() => BottomNavigationPage());
                            }
                          }
                        } else {
                          return;
                        }
                      }),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
