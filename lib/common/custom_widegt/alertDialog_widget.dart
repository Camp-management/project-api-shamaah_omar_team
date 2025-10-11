import 'package:flutter/material.dart';
import 'package:smart_notes/model/bookmarks/bookmarks_model/bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/create_bookmarks/create_bookmarks_model.dart';
import 'package:smart_notes/model/bookmarks/update_bookmarks/update_bookmarks_model.dart';
import '../../model/folder/create_folder/create_folder_model.dart';
import '../../model/folder/folder_model/folder_model.dart';
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
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerColor = TextEditingController();
  final api = NetworkApi();

  late FolderModel getFolder ;
  late BookmarksModel getBookmark ;

  bool? error;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }



  Future<void> loadData() async {

    if(widget.method=="Update") {
      if(widget.type == "Folder") {
        getFolder = await api.folderMethod.getFolder(id:widget.id,);

        controllerName.text = getFolder.name;
        controllerDesc.text= getFolder.desc!;
        controllerColor.text= getFolder.color!;
      }
      else  if(widget.type == "Bookmark") {
        getBookmark = await api.bookmarksMethod.getBookmark(id:widget.id,);

        controllerName.text = getBookmark.url;
        controllerDesc.text= getBookmark.desc;
        controllerColor.text= getBookmark.content_type;
      }
    }
  }

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
    /// return dialog based on folder or bookmarks
    return AlertDialog(
      title: Text("$method $type"),
      content: SizedBox(
        height: 200,
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller:  controllerName,
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
                await api.folderMethod.updateFolders(
                  inputData: data,
                );
              } else if (type == "Folder" && method == "Create") {
                CreateFolderModel data = CreateFolderModel(
                  name: controllerName.text,
                  desc: controllerDesc.text,
                  color: controllerColor.text,
                );
              await api.folderMethod.createFolders(
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
               await api.bookmarksMethod.createBookmark(
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
                 await api.bookmarksMethod.updateBookmarks(
                  inputData: data,
                );
              }
              Navigator.pop(context, true);

              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                SnackBar(
                  backgroundColor:Color(0xFF21B7CA),
                  content: Text(
                    "$type has been ${method == "Update" ? "Updated" : "Created"}",
                      style: TextStyle(fontSize: 20),),
                ),
              );
            } on FormatException catch (error) {
              ScaffoldMessenger.maybeOf(
              context,
              )?.showSnackBar(SnackBar(
                  backgroundColor: Color(0xFFFE4A49),
                  content: Text(error.message,style: TextStyle(fontSize: 20))));
            } catch (error) {
              ScaffoldMessenger.maybeOf(
              context,
              )?.showSnackBar(SnackBar(
                  backgroundColor: Color(0xFFFE4A49),
                  content: Text(error.toString(),style: TextStyle(fontSize: 20))));
            }
          },
          child: Text(method == "Update" ? "update" : "create"),
        ),
      ],
    );
  }
}
