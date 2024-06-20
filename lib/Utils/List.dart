import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// class StudentDetail {
//   TextEditingController? sname;
//   TextEditingController? sgrid;
//   TextEditingController? sstd;
//
//   File? img;
//
//   StudentDetail({this.img, this.sgrid, this.sname, this.sstd});
// // List<StudentDetail> = [];
// // factory StudentDetail.fromstudent(Map m1)
// // {
// //   return
// // }
// // StudentDetail.toList()
// // {
// //       return StudentDetail.toList()
// // }
// }
class StudentDetail{
  TextEditingController? txtname;
  TextEditingController? txtgrid;
  TextEditingController? txtstd;
  File? img;
  StudentDetail({this.txtgrid,this.txtname,this.txtstd,this.img});

}
List <StudentDetail> StudentList=[];
ImagePicker imgpick=ImagePicker();
int? index;

