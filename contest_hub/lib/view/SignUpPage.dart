import 'package:contest_hub/provider/authProvider.dart';
import 'package:contest_hub/provider/readdataProvider.dart';
import 'package:contest_hub/view/loginPage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool isvisible = false;
  bool isvisibleagain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("SignUp"),
        ),
        body: Form(
          key: _form,
          child: Consumer(builder: (context, ref, child) {
            return ListView(children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   child: Container(
                  //     height: 30,
                  //     width: 170,
                  //     decoration: BoxDecoration(
                  //         color: contestant ? Colors.red : Colors.white,
                  //         border: Border.all(
                  //             color: contestant ? Colors.red : Colors.black)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(
                  //           Icons.person_outlined,
                  //           color: contestant ? Colors.white : Colors.black,
                  //         ),
                  //         const SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text(
                  //           "Contestant",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color:
                  //                   contestant ? Colors.white : Colors.black),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     ref.read(iscontestant.notifier).toggle();
                  //   },
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return " value is null";
                        }
                        // else if (value != passwordcontroller.text) {
                        //   return "password not matching";
                        // }
                        else {
                          return null;
                        }
                      }),
                      controller: fullnamecontroller,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Email Id",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return " value is null";
                        }
                        // else if (value != passwordcontroller.text) {
                        //   return "password not matching";
                        // }
                        else {
                          return null;
                        }
                      }),
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Password",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: isvisibleagain,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return " value is null";
                        }
                        // else if (value != passwordcontroller.text) {
                        //   return "password not matching";
                        // }
                        else {
                          return null;
                        }
                      }),
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: isvisibleagain
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              setState(() {
                                isvisibleagain = !isvisibleagain;
                              });
                            },
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Confirm Password",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: isvisible,
                      controller: repasswordcontroller,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return " value is null";
                        } else if (value != passwordcontroller.text) {
                          return "password not matching";
                        } else {
                          return null;
                        }
                      }),
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: isvisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              setState(() {
                                isvisible = !isvisible;
                              });
                            },
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    height: 40,
                    width: 3,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  _form.currentState!.save();
                  if (_form.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    ref.watch(authprovider).userSignup(
                        emailcontroller.text.trim(),
                        passwordcontroller.text.trim());

                    Get.to(() => LoginPage());
                  } else {
                    return null;
                  }
                },
              ),
            ]);
          }),
        ));
  }
}
