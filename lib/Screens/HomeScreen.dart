import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/List.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// ImagePicker imgpick = ImagePicker();
File? fileimage;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  TextEditingController txtname = TextEditingController();
                  TextEditingController txtgrid = TextEditingController();
                  TextEditingController txtstd = TextEditingController();
                  File? img;
                  StudentList.add(StudentDetail(
                      txtgrid: txtgrid, txtname: txtname, txtstd: txtstd));
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add Student')),
        ],
        centerTitle: true,
        title: Text('Home Screen'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        (fileimage != null) ? FileImage(fileimage!) : null),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () async {
                          // XFile? image = XFile.fromData()
                          // XFile? img = ImagePicker(pick);
                          XFile? xFileimage = await imgpick.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            fileimage = File(xFileimage!.path);
                          });
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () async {
                          // XFile? image = XFile.fromData()
                          // XFile? img = ImagePicker(pick);
                          XFile? xFileimage = await imgpick.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            fileimage = File(xFileimage!.path);
                          });
                        },
                        icon: Icon(Icons.image_outlined, size: 40)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                    label: 'Student Name',
                    StdController: txtname,
                    stukeyboardtype: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                    label: 'Student Grid',
                    StdController: txtgrid,
                    stukeyboardtype: TextInputType.number),
                SizedBox(
                  height: 20,
                ),
                buildTextFormField(
                    label: 'Student Std',
                    StdController: txtstd,
                    stukeyboardtype: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Submit')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Text('Show Detail')),
              ],
            ),
          );
        },
      )),
    );
  }

  TextFormField buildTextFormField(
      {required label, required StdController, required stukeyboardtype}) {
    return TextFormField(
      keyboardType: stukeyboardtype,
      controller: StdController,
      decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

TextEditingController? txtname = TextEditingController();
TextEditingController? txtgrid = TextEditingController();
TextEditingController? txtstd = TextEditingController();
