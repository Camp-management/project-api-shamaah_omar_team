import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/model/folder/create_folder/create_folder_model.dart';
import 'package:smart_notes/model/folder/folder_model.dart';

import '../../../common/custom_widegt/alertDialog_widget.dart';
import '../../../network/network_api.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  final api = NetworkApi();

  List<FolderModel> allFolder = [];
  bool? error;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final box = GetStorage();
    //if(box.hasData("token")){
    // AuthModel authmodel=AuthModelMapper.fromMap(box.read("token"));
    allFolder = await api.folderObj.getAllFolders();

    // }
    // else{
    //   error=true;
    // }
    setState(() {});
   // print("show all data $allFolder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Folders", style: TextStyle(fontSize: 30)),
                  ...allFolder.map(
                    (item) => Container(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context,MaterialPageRoute<void>
                          // (builder:
                          // (context) => ProductScreen(id:item.id,
                          // image: item.image,
                          // price: item.price,
                          // )
                          // ));
                        },
                        child: ListTile(
                         // leading: Text(item.id.toString()),
                          title: Text(item.name),
                           subtitle:
                           InkWell(
                              onTap: ()  async {
                             await showDialog(
                                  context: context,
                                  builder: (_) =>
                                       AlertdialogWidget(type:"Folder",
                                           method:"Update"
                                         ,id: item.id.toString(),
                                           folderId:"")
                                );

                                await loadData();

                              },
                              child: Icon(Icons.edit_note_outlined,
                                color: Colors.blueAccent,)),
                          trailing:
                          InkWell(
                            onTap: (){
                             // print(item.id.toString());
                              api.folderObj.deleteFolders(id: item.id.toString());
                            setState(() {
                              loadData();
                            });
                            },
                              child: Icon(Icons.delete_outline_outlined,
                                color: Colors.red,))
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      /// add new folder
      floatingActionButton: InkWell(
        onTap: () async{
          await showDialog(
          context: context,
          builder: (_) =>
              AlertdialogWidget(type:"Folder",
                  method:"Update" ,id: "",
                  folderId:"")
          );

          await loadData();

          // showDialog(
          //   context: context,
          //   builder: (_) =>
          //       AlertDialog(
          //     title: const Text("Add new Folder"),
          //     content: SizedBox(
          //       height: 200,
          //       child: Column(
          //         spacing: 16,
          //         children: [
          //           TextField(
          //             controller: controllerName,
          //             decoration: InputDecoration(
          //               labelText: "Folder Name",
          //               border: OutlineInputBorder(),
          //             ),
          //           ),
          //           TextField(
          //             controller: controllerDesc,
          //             decoration: InputDecoration(
          //               labelText: "Folder Desc",
          //               border: OutlineInputBorder(),
          //             ),
          //           ),
          //           TextField(
          //             controller: controllerColor,
          //             decoration: InputDecoration(
          //               labelText: "Folder Color",
          //               border: OutlineInputBorder(),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     actions: [
          //       TextButton(
          //         onPressed: () {
          //           setState(() {
          //             //  notes.add(controllerName.text);
          //           });
          //           // saveNotes();
          //         },
          //         child: Text("cancel"),
          //       ),
          //       TextButton(
          //         onPressed: () async {
          //           try {
          //             // CreateFolderModel data = CreateFolderModel(
          //             //   name: "string",//controllerName.text,
          //             //   desc: "string",//controllerDesc.text,
          //             //   color: "string",//controllerColor.text,
          //             // );
          //             // final response = await api.folderObj.createFolders(
          //             //   inputData: data,
          //             // );
          //             // // token = response.token;
          //             // //  final box=GetStorage();
          //             // //  box.write("token",token);
          //             // //print( box.read("token"));
          //             // print("Screen: $response");
          //
          //             setState(() {});
          //             Navigator.pop(context);
          //
          //             ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          //               SnackBar(content: Text("Folder has been created")),
          //             );
          //           } on FormatException catch (error) {
          //             // ScaffoldMessenger.maybeOf(
          //             // context,
          //             // )?.showSnackBar(SnackBar(content: Text(error.message)));
          //             print(error.message);
          //           } catch (error) {
          //             // ScaffoldMessenger.maybeOf(
          //             // context,
          //             // )?.showSnackBar(SnackBar(content: Text(error.toString())));
          //             print(error.toString());
          //           }
          //           //  Navigator.pop(context);
          //         },
          //         child: Text("add"),
          //       ),
          //     ],
          //   ),
          // );
        },
        child: Icon(Icons.folder_copy),
      ),
    );
  }
}
