// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:lab2/Data/repo/test_repo.dart';
// import 'package:lab2/main.dart';
// import 'package:lab2/models/TestModel.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'dart:typed_data';
//
// import '../Data/repo/pro_repo.dart';
// import '../models/ProModel.dart';
// import '../widgets/myappbar.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// selectImageFromGallery() async {
//   XFile? file = await ImagePicker()
//       .pickImage(source: ImageSource.gallery, imageQuality: 10);
//   if (file != null) {
//     return file.path;
//   } else {
//     return '';
//   }
// }
//
//
// class ProEditView extends StatefulWidget {
//   ProEditView(this.p);
//   ProModel p;
//
//   @override
//   State<ProEditView> createState() => _ProEditView();
// }
//
//
//
//
// class _ProEditView extends State<ProEditView> {
//
//
//
//   late ProModel item;
//   String ?selectedImagePath;
//   var nameCtr;
//   var detailsCtr;
//   var priceCtr;
//   var imgCtr;
//
//
//   bool loading=false;
//   bool iserror=false;
//   bool issuccess=false;
//   String error="";
//
// @override
//   void initState() {
//   super.initState();
//   nameCtr=TextEditingController(text: widget.p.name);
//   selectedImagePath =widget.p.img??"" ;
//   detailsCtr=TextEditingController(text: widget.p.details);
//   priceCtr=TextEditingController(text: widget.p.price.toString());
//   imgCtr=TextEditingController(text: widget.p.img??"");
//   id=widget.p.id;
//
//
//   }
// var id;
//
//
//
//
//   var formKey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: myAppbar("Edit Pro"),
//       body:
//       Form(key: formKey,child:
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             selectedImagePath == ''
//                 ? Container(child: Icon(Icons.image),width: 50,height: 50,)
//
//                 : Image.file(File(selectedImagePath!), height: 200, width: 200, fit: BoxFit.fill,),
//             Text(
//               'Select Image',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.green),
//                     padding:
//                     MaterialStateProperty.all(const EdgeInsets.all(20)),
//                     textStyle: MaterialStateProperty.all(
//                         const TextStyle(fontSize: 14, color: Colors.white))),
//                 onPressed: () async {
//                   selectedImagePath = await selectImageFromGallery();
//                   print('Image_Path:-');
//                   print(selectedImagePath);
//                   if (selectedImagePath != '') {
//
//
//                     setState(() {
//                       //selectedImagePath=selectedImagePath
//
//
//                     });
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text("No Image Selected !"),
//                     ));
//                   }
//                   setState(() {});
//                 },
//                 child: const Text('Select')),
//             const SizedBox(height: 10),
//
//
//
//             SizedBox(height: 100,),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//
//                 controller: nameCtr,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   hintText: "Name",
//                   labelText: "Name",
//
//
//                   labelStyle: TextStyle(fontWeight: FontWeight.bold),
//                   counterText: "20",
//                   border:
//                   OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                       borderRadius: BorderRadius.circular(20)),
//                   errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(20)),
//
//
//
//                 ),
//
//
//                 validator: (val){
//                   if(val == ""){
//                     return "value is null";}
//                   if(val != null){
//                     if(val.length <3){
//                       return "name must be more than 3 chars";
//                     }
//
//                   }
//                 }
//                 ,
//
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//
//                 controller: detailsCtr,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   hintText: "Details",
//                   labelText: "Details",
//                   labelStyle: TextStyle(fontWeight: FontWeight.bold),
//                   counterText: "20",
//                   border:
//                   OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                       borderRadius: BorderRadius.circular(20)),
//                   errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(20)),
//
//
//
//                 ),
//
//
//                 validator: (val){
//                   if(val == ""){
//                     return "value is null";}
//                   if(val != null){
//                     if(val.length <3){
//                       return "details must be more than 3 chars";
//                     }
//
//                   }
//                 }
//                 ,
//
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//
//                 controller: priceCtr,
//                 keyboardType: TextInputType.number,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   hintText: "Price",
//                   labelText: "Price",
//                   labelStyle: TextStyle(fontWeight: FontWeight.bold),
//                   counterText: "20",
//                   border:
//                   OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                       borderRadius: BorderRadius.circular(20)),
//                   errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(20)),
//
//
//
//                 ),
//
//
//                 validator: (val){
//                   if(val == ""){
//                     return "value is null";}
//
//
//                 }
//
//                 ,
//
//               ),
//             ),
//
//             loading?CircularProgressIndicator():
//             TextButton(onPressed: ()async{
//               if(formKey.currentState!.validate()){
//                 try{
//                   setState(() {
//                     loading=true;
//                     issuccess=false;
//                     iserror=false;
//
//                   });
//                   var date={
//                     "Id":id,
//                     "Name":nameCtr.text,
//                     "Price":double.parse(priceCtr.text),
//                     "Img":selectedImagePath,
//                     "Details":detailsCtr.text,
//
//
//                   };
//                   var editRes=await ProRepository().editToDb(ProModel.fromJson(date));
//                   if(editRes ){
//                     setState(() {
//                       loading=false;
//                       issuccess=true;
//                       iserror=false;
//                       error="";
//
//                     });
//                     Navigator.of(context).pop(true);
//                   }
//                   else{
//                     setState(() {
//                       loading=false;
//                       issuccess=false;
//                       iserror=true;
//                       error="Operation failed!!";
//
//                     });
//                   }
//                 }
//
//                 catch(e){
//                   setState(() {
//                     loading=false;
//                     issuccess=false;
//                     iserror=true;
//                     error="Exception: ${e}";
//
//                   });
//                 }
//               }
//
//             }
//
//
//
//
//
//                 , child: Text("send")),
//             iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
//             issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox()
//
//
//
//
//           ],
//         ),
//       ),),
//     );
//   }
// }
//
//
