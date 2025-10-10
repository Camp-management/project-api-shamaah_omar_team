
import 'package:flutter/material.dart';

import '../../model/folder/create_folder/create_folder_model.dart';
import '../../model/folder/folder_model.dart';
import '../../model/folder/update_folder/update_folder_model.dart';
import '../../network/network_api.dart';

class AlertdialogWidget extends StatefulWidget {
  final String id,type;
  const AlertdialogWidget({super.key, required this.id, required this.type});

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
    return
      buildAlertDialog(context,widget.type,widget.id,controllerName,controllerDesc,controllerColor);

  }

  AlertDialog buildAlertDialog(BuildContext context,type,
      id,controllerName,controllerDesc,controllerColor) {
    return AlertDialog(
      title: Text("$type Folder"),
      content: SizedBox(
        height: 200,
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: "Folder Name",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: controllerDesc,
              decoration: InputDecoration(
                labelText: "Folder Desc",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: controllerColor,
              decoration: InputDecoration(
                labelText: "Folder Color",
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

             if(type == "Update") {
               UpdateFolderModel data = UpdateFolderModel(
                 id: id,
                 name: controllerName.text,
                 desc: controllerDesc.text,
                 color: controllerColor.text,
               );
                final response = await api.folderObj.updateFolders(
                  inputData: data,
                );
              }
              else{
               CreateFolderModel data = CreateFolderModel(
                 name: controllerName.text,
                 desc: controllerDesc.text,
                 color: controllerColor.text,
               );
                 final response = await api.folderObj.createFolders(
                             inputData: data);
             }

                Navigator.pop(context, true);

              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                SnackBar(backgroundColor: Colors.green,
                    content: Text("Folder has been  ${type == "Update" ? "Updated" :"Created" }")),
              );
            } on FormatException catch (error) {
              // ScaffoldMessenger.maybeOf(
              // context,
              // )?.showSnackBar(SnackBar(content: Text(error.message)));
              print(error.message);
            } catch (error) {
              // ScaffoldMessenger.maybeOf(
              // context,
              // )?.showSnackBar(SnackBar(content: Text(error.toString())));
              print(error.toString());
            }
            //  Navigator.pop(context);
          },
          child: Text(type=="Update"? "add": "update"),
        ),
      ],
    );
  }
}
