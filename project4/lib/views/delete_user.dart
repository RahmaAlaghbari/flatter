// import 'package:flutter/material.dart';
//
// import '../Data/repo/pro_repo.dart';
// import '../Data/repo/test_repo.dart';
// class DeletePro extends StatefulWidget {
//   DeletePro(this.itemId);
//   final int itemId;
//
//   @override
//   State<DeletePro> createState() => _DeletePro();
// }
//
// class _DeletePro extends State<DeletePro> {
//   String txt="Do u want to delete this item?";
//   bool loading=false;
//   bool iserror=false;
//   bool issuccess=false;
//   String error="";
//   @override
//   Widget build(BuildContext context) {
//     return  AlertDialog(
//       title: Icon(Icons.delete),
//       content: Container(
//         constraints: BoxConstraints(
//           maxWidth: 300,
//           maxHeight: 250,
//           minWidth: 150,
//           minHeight: 150
//         ),
//         child:
//         SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               loading?CircularProgressIndicator():Text("$txt"),
//
//
//               iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
//               issuccess?Text("Deleted successfully",style: TextStyle(color: Colors.green),):SizedBox(),
//               Row(
//                 children: [
//                   TextButton(onPressed: ()async{
//                     try{
//                       setState(() {
//                         loading=true;
//                         issuccess=false;
//                         iserror=false;
//
//                       });
//
//                       var delRes=await ProRepository().deleteFromDb(widget.itemId);
//                       if(delRes ){
//                         setState(() {
//                           loading=false;
//                           issuccess=true;
//                           iserror=false;
//                           error="";
//                           txt="Deleted Successfully";
//
//                         });
//                         Navigator.of(context).pop(true);
//                       }
//                       else{
//                         setState(() {
//                           loading=false;
//                           issuccess=false;
//                           iserror=true;
//                           error="Operation failed!!";
//
//                         });
//                       }
//                     }
//
//                     catch(e){
//                       setState(() {
//                         loading=false;
//                         issuccess=false;
//                         iserror=true;
//                         error="Exception: ${e}";
//
//                       });
//                     }
//
//                   }, child: Text("Yes")),
//                   TextButton(onPressed: (){
//                     Navigator.of(context).pop(false);
//                   }, child: Text("No")),
//
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
