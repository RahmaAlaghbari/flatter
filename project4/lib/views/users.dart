import 'dart:io';

import 'package:flutter/material.dart';

import '../CustomPages/appbar.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserView();
}

class _UserView extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        onRefresh: ()async{
          setState(() {

          });
        },
        child: Scaffold(
          appBar: SearchAppBar(),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
              onPressed: ()async{
                var isAdd=await Navigator.of(context).pushNamed('/proadd');
                if(isAdd!=null && isAdd==true){
                  setState(() {

                  });
                }
              }),

          body: Container(child: FutureBuilder<List<UserModel>>(
            future: UserRepository().getAll(),
            builder: (context,snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else if(snapshot.connectionState ==ConnectionState.done){
                if(snapshot.hasError)
                  return Center(child: Text("Error ${snapshot.error.toString()}"));
                else if(snapshot.hasData){
                  var list=snapshot.data??[];
                  return ListView.separated(
                      itemBuilder: (context,index){
                        return ListTile(leading: list[index].img == ''
                            ? Container(child: Icon(Icons.image),width: 50,height: 50,)

                            : Image.file(File(list[index].img!), height: 200, width: 100, fit: BoxFit.fill,),
                            title: Text("${list[index].fName}"),
                            subtitle:Row(children: [

                              Text("${list[index].email}" ,),
                              SizedBox(width: 50,),
                              Text("${list[index].gender}" ,style: TextStyle(color: Colors.red),),
                            ],),


                            // trailing:
                            //
                            //
                            // Row(mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     IconButton(onPressed:(){
                            //       // var res= ProRepository().getById(list[index].id!.toInt());
                            //       //print(item.id);
                            //       //ProEditView(item!);
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => ProEditView(list[index]),
                            //           ));
                            //
                            //
                            //
                            //     } ,icon:Icon(Icons.edit)),
                            //     IconButton(onPressed:()async{
                            //       var delRes=await showDialog(context: context, builder: (context){
                            //         var id=list[index].id??0;
                            //         return DeletePro(id.toInt());
                            //       });
                            //       if(delRes !=null && delRes ==true){
                            //         setState(() {
                            //
                            //         });
                            //       }
                            //     } ,icon:Icon(Icons.delete)),
                            //   ],
                            // )
                            //
                            //
                            //
                            //
                            //
                            //
                            //


                        );
                      },
                      separatorBuilder: (context,index){
                        return Divider();

                      },
                      itemCount: list.length);
                }
                else{
                  return Center(child: Text("Error ${snapshot.error.toString()}"));

                }

              }
              else{
                return Center(child: Text("Error ${snapshot.error.toString()}"));

              }

            },),),
        ),
      );
  }
}
