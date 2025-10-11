// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_notes/model/bookmarks/create_bookmarks/create_bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/update_bookmarks/update_bookmarks_model.dart';

import '../../model/folder/create_folder/create_folder_model.dart';
import '../../model/folder/folder_model.dart';
import '../../model/folder/update_folder/update_folder_model.dart';
import '../../network/network_api.dart';


class AlertdialogWidget extends StatefulWidget {
  final String id, type, method, folderId;
  const AlertdialogWidget({
    super.key,
    required this.id,
    required this.type,
    required this.method,
    required this.folderId,
  });

  @override
  State<AlertdialogWidget> createState() => _AlertdialogWidgetState();
}

class _AlertdialogWidgetState extends State<AlertdialogWidget> {
  TextEditingController controllerName = TextEditingController(text: "string");
  TextEditingController controllerDesc = TextEditingController(text: "string");
  TextEditingController controllerColor = TextEditingController(text: "string");
  final api = NetworkApi();

  List<FolderModel> allFolder = [];
  bool? error;

  @override
  Widget build(BuildContext context) {
    return buildAlertDialog(
      context,
      widget.type,
      widget.method,
      widget.id,
      widget.folderId,
      controllerName,
      controllerDesc,
      controllerColor,
    );
  }

  AlertDialog buildAlertDialog(
    BuildContext context,
    type,
    method,
    id,
    folderId,
    controllerName,
    controllerDesc,
    controllerColor,
  ) {
    return AlertDialog(
      title: Text("$method $type"),
      content: SizedBox(
        height: 200,
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: type == "Folder" ? "Folder Name" : "Bookmark URL",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: controllerDesc,
              decoration: InputDecoration(
                labelText: type == "Folder" ? "Folder Desc" : "Bookmark Desc",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: controllerColor,
              decoration: InputDecoration(
                labelText: type == "Folder"
                    ? "Folder Color"
                    : "Bookmark Content Type",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel"),
        ),
        TextButton(
          onPressed: () async {
            try {
              if (type == "Folder" && method == "Update") {
                UpdateFolderModel data = UpdateFolderModel(
                  id: id,
                  name: controllerName.text,
                  desc: controllerDesc.text,
                  color: controllerColor.text,
                );

                // ignore: unused_local_variable
                final response = await api.folderObj.updateFolders(
                  inputData: data,
                );
              } else if (type == "Folder" && method == "Create") {
                CreateFolderModel data = CreateFolderModel(
                  name: controllerName.text,
                  desc: controllerDesc.text,
                  color: controllerColor.text,
                );
                // ignore: unused_local_variable
                final response = await api.folderObj.createFolders(
                  inputData: data,
                );
              } else if (type == "Bookmark" && method == "Create") {
                CreateBookmarksModel data = CreateBookmarksModel(
                  url: controllerName.text,
                  desc: controllerDesc.text,
                  content_type: controllerColor.text,
                  is_ticked: false,
                  folder_id: folderId,
                );
                // ignore: unused_local_variable
                final response = await api.bookmarksMethod.createBookmark(
                  inputData: data,
                );
              } else if (type == "Bookmark" && method == "Update") {
                UpdateBookmarksModel data = UpdateBookmarksModel(
                  id: id,
                  url: controllerName.text,
                  desc: controllerDesc.text,
                  content_type: controllerColor.text,
                  is_ticked: false,
                  folder_id: folderId,
                );
                // ignore: unused_local_variable
                final response = await api.bookmarksMethod.updateBookmarks(
                  inputData: data,
                );
              }
              Navigator.pop(context, true);

              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "$type has been  ${method == "Update" ? "Updated" : "Created"}",
                  ),
                ),
              );
              // ignore: unused_catch_clause
            } on FormatException catch (error) {
              // ScaffoldMessenger.maybeOf(
              // context,
              // )?.showSnackBar(SnackBar(content: Text(error.message)));
            } catch (error) {
              // ScaffoldMessenger.maybeOf(
              // context,
              // )?.showSnackBar(SnackBar(content: Text(error.toString())));
            }
            //  Navigator.pop(context);
          },
          child: Text(method == "Update" ? "update" : "create"),
        ),
      ],
    );
  }
}
