import 'package:smart_notes/network/auth_api.dart';
import 'package:smart_notes/network/bookmarks_api.dart';
import 'package:smart_notes/network/folder_api.dart';

class NetworkApi {
  final folderMethod = FolderApi();
  final authMethod = AuthApi();
  final bookmarksMethod = BookmarksApi();
}
