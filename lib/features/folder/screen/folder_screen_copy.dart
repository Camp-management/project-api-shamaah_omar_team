import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/model/folder/create_folder/create_folder_model.dart';
import 'package:smart_notes/model/folder/folder_model.dart';

import '../../../common/custom_widegt/alertDialog_widget.dart';
import '../../../network/network_api.dart';
import '../../bookmarks/screen/bookmarks_screen.dart';

class FolderScreenCopy extends StatefulWidget {
  const FolderScreenCopy({super.key});

  @override
  State<FolderScreenCopy> createState() => _FolderScreenCopyState();
}

class _FolderScreenCopyState extends State<FolderScreenCopy> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Folders", style: TextStyle(fontSize: 30)),
                /// list of all folder
                ...allFolder.map(
                  (item) => Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute<void>
                        (builder:
                        (context) =>
                            BookmarksScreen(folder_id:item.id)
                        ));
                      },
                        child:
          Slidable(
            // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                // A pane can dismiss the Slidable.
                //dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                 //   flex: 2,
                    onPressed: (_)   async {
                      await showDialog(
                          context: context,
                          builder: (_) =>
                              AlertdialogWidget(type:"Folder",
                                method:"Update" ,
                                id: item.id.toString(),
                                  folderId:"")
                      );

                      await loadData();

                    },
                    backgroundColor: const  Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (_) async{
                     await api.folderObj.deleteFolders(id: item.id.toString());
                    //setState(() {
                     await loadData();
                   // });
                     },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),

              child:
             ListTile(
               leading: Icon(Icons.folder,
             ),
                        title: Text(item.name),
                         trailing: Icon(Icons.swap_horiz),
                         // subtitle:
                         // InkWell(
                         //    onTap: ()
                         //    async {
                         //   await showDialog(
                         //        context: context,
                         //        builder: (_) =>
                         //             AlertdialogWidget(type:"Update",id: item.id.toString(),)
                         //      );
                         //
                         //      await loadData();
                         //
                         //    },
                         //    child: Icon(Icons.edit_note_outlined,
                         //      color: Colors.blueAccent,)),
                        // trailing:
                        // InkWell(
                        //   onTap: (){
                        //    // print(item.id.toString());
                        //     api.folderObj.deleteFolders(id: item.id.toString());
                        //   setState(() {
                        //     loadData();
                        //   });
                        //   },
                        //     child: Icon(Icons.delete_outline_outlined,
                        //       color: Colors.red,))
                      ),
          )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      /// Create new folder
      floatingActionButton: InkWell(
        onTap: () async{
          await showDialog(
          context: context,
          builder: (_) =>
              AlertdialogWidget(type:"Folder",
                  method: "Create",id: "",
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
