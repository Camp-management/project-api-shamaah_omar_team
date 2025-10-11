import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/folder/create_folder/create_folder_model.dart';
import '../model/folder/folder_model/folder_model.dart';
import '../model/folder/update_folder/update_folder_model.dart';
import 'constant_api.dart';

class FolderApi {
  late final ConstantApi _constant = ConstantApi();

  /// get all folders
  Future<List<FolderModel>> getAllFolders() async {
    try {
      var url = Uri.parse(_constant.baseURL + _constant.folderEndPoint);
      var response = await http.get(url, headers: _constant.foldersHeader);
      if (response.statusCode.toString().startsWith("2")) {
        final folder = jsonDecode(response.body);

        /// call Mapper to show data
        List<FolderModel> allFolders = List.from(
          folder ?? [],
        ).map((item) => FolderModelMapper.fromMap(item)).toList();

        return allFolders;
      }
      throw FormatException("Issue in get all Folder!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// create new folder
  Future<CreateFolderModel> createFolders({required CreateFolderModel inputData,}) async {
    try {
      var url = Uri.parse(_constant.baseURL + _constant.createFolderEndPoint);
      var response = await http.post(
        url,
        headers: _constant.subHeader,
        body: inputData.toJson(),
      );

      if (response.statusCode.toString().startsWith("2")) {
        final json = jsonDecode(response.body);
        final data = json['data'];

        final folder = CreateFolderModelMapper.fromMap(data);

        return folder;
      }
      throw FormatException("Issue in create Folder!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///delete folder
  Future deleteFolders({required String id}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.deleteFolderEndPoint}$id",
      );
      var response = await http.delete(url, headers: _constant.foldersHeader);

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data

        final folder = jsonDecode(response.body);
        return folder;
      }
      throw FormatException("Issue in deleting Folder!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///update folder
  Future<UpdateFolderModel> updateFolders({required UpdateFolderModel inputData,}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.updateFolderEndPoint}${inputData.id}",
      );
      var response = await http.put(
        url,
        headers: _constant.subHeader,
        body: inputData.toJson(),
      );

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data

        final folder = UpdateFolderModelMapper.fromMap(
          jsonDecode(response.body),
        );

        return folder;
      }
      throw FormatException("Issue in updating Folder!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// get folder by id
  Future<FolderModel> getFolder({required String id}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.getFolderEndPoint}$id",
      );
      var response = await http.get(url, headers: _constant.subHeader);

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data
         final json = jsonDecode(response.body);
        final data = json['folder'];
        FolderModel allFolders =  FolderModelMapper.fromMap(data);
        return allFolders;
      }
    throw FormatException("Issue in get Folder!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }



}
