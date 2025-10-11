import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_notes/model/bookmarks/bookmarks_model/bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/create_bookmarks/create_bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/update_bookmarks/update_bookmarks_model.dart';
import 'constant_api.dart';

class BookmarksApi {
  late final ConstantApi _constant = ConstantApi();

  /// get all bookmarks
  Future<List<BookmarksModel>> getAllBookmarks() async {
    try {
      var url = Uri.parse(_constant.baseURL + _constant.bookmarksEndPoint);
      var response = await http.get(url, headers: _constant.subHeader);

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data
        final bookmark = jsonDecode(response.body);
        List<BookmarksModel> allBookmarks = List.from(
          bookmark ?? [],
        ).map((item) => BookmarksModelMapper.fromMap(item)).toList();
        return allBookmarks;
      }
      throw FormatException("Issue in get all Bookmarks!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// create new bookmark
  Future<CreateBookmarksModel> createBookmark({required CreateBookmarksModel inputData,}) async {
    try {
      var url = Uri.parse(_constant.baseURL + _constant.createBookmarksEndPoint);
      var response = await http.post(
        url,
        headers: _constant.subHeader,
        body: inputData.toJson(),
      );

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data
        final json = jsonDecode(response.body);
        final data = json['data'];
        final bookmark = CreateBookmarksModelMapper.fromMap(data);

        return bookmark;
      }
      throw FormatException("Issue in create Bookmark !!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// get bookmarks by folder
  Future<List<BookmarksModel>> getBookmarksByFolder({required String id,}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.bookmarksByFolderEndPoint}$id",
      );
      var response = await http.get(url, headers: _constant.subHeader);

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data
        final bookmark = jsonDecode(response.body);
        List<BookmarksModel> allBookmarks = List.from(
          bookmark ?? [],
        ).map((item) => BookmarksModelMapper.fromMap(item)).toList();
        return allBookmarks;
      }
       throw FormatException("Issue in getting Bookmark by folder!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///delete bookmark
  Future deleteBookmarks({required String id}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.updateDeleteBookmarksEndPoint}$id",
      );
      var response = await http.delete(url, headers: _constant.foldersHeader);

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data

        final bookmark = jsonDecode(response.body);

        return bookmark;

      }
       throw FormatException("Issue in deleting Bookmark !!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///update bookmark
  Future<UpdateBookmarksModel> updateBookmarks({required UpdateBookmarksModel inputData,}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.updateDeleteBookmarksEndPoint}${inputData.id}",
      );
      var response = await http.put(
        url,
        headers: _constant.subHeader,
        body: inputData.toJson());

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data
        final bookmark =
        UpdateBookmarksModelMapper.fromMap(
          jsonDecode(response.body),
        );
        return bookmark;


      }
    throw FormatException("Issue in updating Bookmark!!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  /// get bookmark by id
  Future<BookmarksModel> getBookmark({required String id}) async {
    try {
      var url = Uri.parse(
        "${_constant.baseURL}${_constant.bookmarksEndPoint}/$id",
      );
      var response = await http.get(url, headers: _constant.subHeader);

      if (response.statusCode.toString().startsWith("2")) {
        /// call Mapper to show data

        final bookmark = jsonDecode(response.body);
        BookmarksModel allBookmark =  BookmarksModelMapper.fromMap(bookmark);

        return allBookmark;
      }
      throw FormatException("Issue in get bookmark !!");
    } on FormatException catch (_) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }


}
