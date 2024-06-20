import 'package:core_flutter_exam/Screens/HomeScreen.dart';
import 'package:core_flutter_exam/Utils/List.dart';
import 'package:flutter/material.dart';

class ShowDetail extends StatefulWidget {
  const ShowDetail({super.key});

  @override
  State<ShowDetail> createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, '/');
        },icon: Icon(Icons.arrow_back),),

        centerTitle: true,
        title: Text('Student Detail'),
      ),
      body: ListView.builder(
        itemCount: StudentList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  // CircleAvatar(radius: 80,backgroundImage: FileImage(fileimage!),),
                  CircleAvatar(
                      radius: 40,
                      backgroundImage:
                      (fileimage != null) ? FileImage(fileimage!) : null),

                  SizedBox(
                    height: 80,
                    width: 200,
                    child: ListTile(
                      title: Text(txtname!.text, style: TextStyle(fontSize: 15)),
                      subtitle: Text(txtgrid!.text, style: TextStyle(fontSize: 15)),
                      trailing: Text(
                        txtstd!.text,
                        style: TextStyle(fontSize: 15),
                      ),
                      iconColor: Colors.red,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        return setState(() {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Udpate Info',
                                    ),
                                    content: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        alertBuildTextFormField(
                                            stuUpdatekbd: TextInputType.text,
                                            stuUpdateController: txtname),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        alertBuildTextFormField(
                                            stuUpdatekbd: TextInputType.number,
                                            stuUpdateController: txtgrid),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        alertBuildTextFormField(
                                            stuUpdatekbd: TextInputType.number,
                                            stuUpdateController: txtstd),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )),
                                    actions: [
                                      TextButton(
                                          child: Text('Cancel'), onPressed: () {}),
                                      TextButton(
                                          child: Text('Save'),
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pushNamed(context, '/detail');
                                          }),
                                    ],
                                  ));
                        });
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        StudentList.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField alertBuildTextFormField(
      {required stuUpdatekbd, required stuUpdateController}) {
    return TextFormField(
      keyboardType: stuUpdatekbd,
      controller: stuUpdateController,
      decoration: InputDecoration(
          labelText: 'Update Info',
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
