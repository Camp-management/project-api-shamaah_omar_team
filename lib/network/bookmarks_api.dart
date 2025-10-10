import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_notes/model/bookmarks/bookmarks_model/bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/create_bookmarks/create_bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/update_bookmarks/update_bookmarks_model.dart';
import 'constant_api.dart';


class BookmarksApi {

  late final ConstantApi _constant=ConstantApi();

  /// get all folders
  Future<List<BookmarksModel>>
  getAllBookmarks()
  async {
    try {
      var url = Uri.parse(_constant.baseURL+_constant.bookmarksEndPoint);
      var response = await http.get(url,headers: _constant.subHeader);
      // print("URL ${response.statusCode.toString()}");

      if (response.statusCode.toString().startsWith("2")) {
        final folder= jsonDecode(response.body);
        //    print(folder);

        List<BookmarksModel>
        allFolders =
        List.from( folder ?? []).map((item) =>
            BookmarksModelMapper.fromMap(item)).toList();
        //print("allFolders : $allFolders");
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
  Future<CreateBookmarksModel>
  createBookmark({required CreateBookmarksModel inputData})
  async {
    try {
      var url = Uri.parse(_constant.baseURL+_constant.createBookmarksEndPoint);
      var response = await http.post(url,
          headers:  _constant.subHeader,
          body: inputData.toJson()
      );
      print("URL $url");
      print("body ${inputData.toJson()}");

      print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
        // final folder=// jsonDecode(response.body);
        // CreateFolderModelMapper.fromMap(jsonDecode(response.body));
        final json = jsonDecode(response.body);
        final data = json['data'];

        final folder = CreateBookmarksModelMapper.fromMap(data);

        print(folder);
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

  /// get bookmarks by folder
  Future<List<BookmarksModel>>
  getBookmarksByFolder({required String id})
  async {
    try {
      var url = Uri.parse("${_constant.baseURL}${_constant.bookmarksByFolderEndPoint}$id");
      var response = await http.get(url,headers: _constant.subHeader);
      // print("URL ${response.statusCode.toString()}");

      if (response.statusCode.toString().startsWith("2")) {
        final folder= jsonDecode(response.body);
        //    print(folder);

        List<BookmarksModel>
        allFolders =
        List.from( folder ?? []).map((item) =>
            BookmarksModelMapper.fromMap(item)).toList();
        //print("allFolders : $allFolders");
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

  ///delete folder
  Future
  deleteBookmarks({required String id})
  async {
    try {
      var url = Uri.parse("${_constant.baseURL}${_constant.updateDeleteBookmarksEndPoint}$id");
      var response = await http.delete(url,
        headers:  _constant.foldersHeader,   );

      print("URL $url");
      //  print("body ${inputData.toJson().runtimeType}");

      print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
        final folder= jsonDecode(response.body);
        //print(folder);
        // CreateFolderModelMapper.fromJson(jsonDecode(response.body));

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


  ///update folder
  Future<UpdateBookmarksModel>
  updateBookmarks({//required String id,
    required UpdateBookmarksModel inputData
    //String name,  required String desc,  required String color
  })
  async {
    try {
      var url = Uri.parse("${_constant.baseURL}${_constant.updateDeleteBookmarksEndPoint}${inputData.id}");
      var response = await http.put(url,
          headers:  _constant.updateCreateHeader,
          body:
          // {
          //   "id": id,
          inputData.toJson()
        ///"parent_folder": ""
        // }
      );

      // print("URL $url ${response.statusCode}");
      //  print(inputData.toJson());
      //  print(jsonEncode(inputData.toJson()).runtimeType);
      // print("response ${response.body.toString()}");
      if (response.statusCode.toString().startsWith("2")) {
         final folder= //jsonDecode(response.body);
        UpdateBookmarksModelMapper.fromMap(jsonDecode(response.body));

        // print(folder);
        return folder;
        /// call Mapper to show data
        // return AuthModelMapper.fromJson(response.body);
      }
      //   throw FormatException("Issue in get all Folder!!");
      throw FormatException();

    }
    on FormatException catch(errorg){
      print(errorg.message);
      throw FormatException(errorg.message);
    }
    catch (error){
      print(error.toString());
      throw Exception(error);
    }
  }
}