import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/folder/create_folder/create_folder_model.dart';
import '../model/folder/folder_model.dart';
import '../model/folder/update_folder/update_folder_model.dart';
import 'constant_api.dart';

class FolderApi {
  late final ConstantApi _constant = ConstantApi();

  /// get all folders
  Future<List<FolderModel>> getAllFolders() async {
    try {
      var url = Uri.parse(_constant.baseURL + _constant.folderEndPoint);
      var response = await http.get(url, headers: _constant.foldersHeader);
      // print("URL ${GetStorage().read("token")}");

      if (response.statusCode.toString().startsWith("2")) {
        final folder = jsonDecode(response.body);
        //    print(folder);

        List<FolderModel> allFolders = List.from(
          folder ?? [],
        ).map((item) => FolderModelMapper.fromMap(item)).toList();
        //print("allFolders : $allFolders");
        return allFolders;

        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
      //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// create new folder
  Future<CreateFolderModel> createFolders({
    required CreateFolderModel inputData,
  }) async {
    try {
      var url = Uri.parse(_constant.baseURL + _constant.createFolderEndPoint);
      var response = await http.post(
        url,
        headers: _constant.updateCreateHeader,
        body: inputData.toJson(),
      );
      print("URL $url");
      print("body ${inputData.toJson()}");

      print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
        // final folder=// jsonDecode(response.body);
        // CreateFolderModelMapper.fromMap(jsonDecode(response.body));
        final json = jsonDecode(response.body);
        final data = json['data'];

        final folder = CreateFolderModelMapper.fromMap(data);

        print(folder);
        return folder;

        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
      //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
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

  ///delete folder
  Future deleteFolders({required String id}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.deleteFolderEndPoint}$id",
      );
      var response = await http.delete(url, headers: _constant.foldersHeader);

      print("URL $url");
      //  print("body ${inputData.toJson().runtimeType}");

      print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
        final folder = jsonDecode(response.body);
        //print(folder);
        // CreateFolderModelMapper.fromJson(jsonDecode(response.body));

        return folder;

        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
      //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///update folder
  Future<UpdateFolderModel> updateFolders({
    //required String id,
    required UpdateFolderModel inputData,
    //String name,  required String desc,  required String color
  }) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.updateFolderEndPoint}${inputData.id}",
      );
      var response = await http.put(
        url,
        headers: _constant.updateCreateHeader,
        body:
            // {
            //   "id": id,
            inputData.toJson(),

        ///"parent_folder": ""
        // }
      );

      // print("URL $url ${response.statusCode}");
      //  print(inputData.toJson());
      //  print(jsonEncode(inputData.toJson()).runtimeType);
      // print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
        final folder = //jsonDecode(response.body);
        UpdateFolderModelMapper.fromMap(
          jsonDecode(response.body),
        );

        // print(folder);
        return folder;

        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
      //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();
    } on FormatException catch (errorg) {
      print(errorg.message);
      throw FormatException(errorg.message);
    } catch (error) {
      print(error.toString());
      throw Exception(error);
    }
  }
}
