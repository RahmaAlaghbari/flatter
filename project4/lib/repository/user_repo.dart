import 'package:dio/dio.dart';

import '../models/user_model.dart';


class UserRepository{
  late Dio dio ;
  UserRepository(){
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<UserModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await dio.get('https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/users');
      List<UserModel> items = [];
      if(res.statusCode == 200){
        var data = res.data as List;
        if(data.isNotEmpty){
          for (var e in data) {
            items.add(UserModel.fromJson(e));
          }
          return items;
        }
      }

      return items;
    }
    catch(ex){
      rethrow;
    }
  }

  // Future<Object> add(UserModel obj)async{
  //   try{
  //     await Future.delayed(Duration(milliseconds: 300));
  //     var addRes = await dio.post('https://fakestoreapi.com/products', data: obj.toJson());
  //     print("###########################################add res: ${addRes}");
  //     if (addRes.statusCode == 200) {
  //
  //       var data = addRes.data;
  //       var prod = UserModel.fromJson(data);
  //       if(prod != null){
  //         return prod.id??0;
  //       }
  //       else{
  //         return 0;
  //       }
  //     }
  //
  //     return 0;
  //   }
  //   catch(ex){
  //     rethrow;
  //   }
  // }

}