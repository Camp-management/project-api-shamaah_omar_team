import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/folder/create_folder/create_folder_model.dart';
import '../model/folder/folder_model.dart';
import 'constant_api.dart';

class FolderApi {

  late final ConstantApi _constant=ConstantApi();

  /// get all folders
  Future<List<FolderModel>>
  getAllFolders()
  async {
    try {
      var url = Uri.parse(_constant.baseURL+_constant.folderEndPoint);
      var response = await http.get(url,headers: _constant.foldersHeader);
      print("URL ${response.statusCode.toString()}");

      if (response.statusCode.toString().startsWith("2")) {
        final folder= jsonDecode(response.body);
        print(folder);

        List<FolderModel>
        allFolders =
       List.from( folder ?? []).map((item) =>
           FolderModelMapper.fromMap(item)).toList();
        print("allFolders : $allFolders");
        return allFolders;
        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
   //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();

    }
    on FormatException catch(_){
      rethrow;
    }
    catch (error){
      throw Exception(error);
    }
  }

/// create new folder
  Future<CreateFolderModel>
  createFolders({required CreateFolderModel inputData})
  async {
    try {
      var url = Uri.parse(_constant.baseURL+_constant.createFolderEndPoint);
      var response = await http.post(url,
          headers: // _constant.foldersHeader,
          {"Accept": "application/json",
            "Authorization" :
            "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImVrT3MrMlluOXROd1hwYzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL21pb3Fvb21yYmp2eGdwdmJ5cmpjLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlNDlmZGJlMC1hZDIxLTQ4MDItYTAyMi0xYTFlZjIzZmYyZmIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYwMDQ4MzU1LCJpYXQiOjE3NjAwNDQ3NTUsImVtYWlsIjoic2hhbWFhaEBleGFtcGxlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJzaGFtYWFoQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiZTQ5ZmRiZTAtYWQyMS00ODAyLWEwMjItMWExZWYyM2ZmMmZiIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjAwNDQ3NTV9XSwic2Vzc2lvbl9pZCI6IjcwMGVmZjQ4LTg2YmEtNDljMC1iZjk3LWU4YzIzNTczYjBlMiIsImlzX2Fub255bW91cyI6ZmFsc2V9.dLAM7wwLlcGSo-C6ZJpNDt9jsQS8RLjyTVeVW1oBflk"}
      , body: jsonEncode(inputData.toJson())
      );
      print("URL $url");
      print("body ${inputData.toJson().runtimeType}");

      print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
        final folder=// jsonDecode(response.body);
        //print(folder);
        CreateFolderModelMapper.fromJson(jsonDecode(response.body));

        return folder;
        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
      //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();

    }
    on FormatException catch(_){
      rethrow;
    }
    catch (error){
      throw Exception(error);
    }
  }
  // Future<List<ProductModel>>
  // getProduct(int id)
  // async {
  //   try {
  //     var url = Uri.parse("${_constant.baseURL}${_constant.productEndPoint}/$id");
  //     var response = await http.get(url,
  //         headers: _constant.header
  //     );
  //
  //     if (response.statusCode.toString().startsWith("2")) {
  //       final product= jsonDecode(response.body);
  //       List<ProductModel>
  //       allProducts = List.from(
  //           product ?? []).map((item) => ProductModelMapper.fromMap(item)).toList();
  //
  //       return allProducts;
  //       /// call Mapper to show data
  //       // return AuthModelMapper.fromJson(response.body);
  //     }
  //     throw FormatException("Issue in get all product!!");
  //   }
  //   on FormatException catch(_){
  //     rethrow;
  //   }
  //   catch (error){
  //     throw Exception(error);
  //   }
  // }

}