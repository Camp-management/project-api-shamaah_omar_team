
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smart_notes/model/bookmarks/bookmarks_model/bookmarks_model.dart';
import 'package:smart_notes/network/network_api.dart';

import '../../../common/custom_widegt/alertDialog_widget.dart';

class BookmarksScreen extends StatefulWidget {
  final dynamic folder_id;

  const BookmarksScreen({super.key,required this.folder_id});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  var api=NetworkApi();

  List<BookmarksModel> allBookmarks = [];
  bool? error;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    //final box = GetStorage();
    //if(box.hasData("token")){
    // AuthModel authmodel=AuthModelMapper.fromMap(box.read("token"));
    allBookmarks = await api.bookmarksMethod.getBookmarksByFolder(id: widget.folder_id);

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
      appBar: AppBar(leading:
      InkWell(onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios)),
        title: Text("Bookmarks"),),
      body:
      SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
      //    Text("Bookmarks for: ${widget.folder_id}"),
          ...allBookmarks.map(
                (item) => Container(
              child: InkWell(
                  onTap: () {
                    // Navigator.push(context,MaterialPageRoute<void>
                    //   (builder:
                    //     (context) => BookmarksScreen(folder_id:item.id)
                    // ));
                  },child:
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
                                AlertdialogWidget(type:"Bookmark",
                                  method:"Update" ,
                                    id: item.id.toString(),
                                folderId:widget.folder_id)
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
                        await api.bookmarksMethod.deleteBookmarks(id: item.id.toString());
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
                  leading: Image(image:
                  AssetImage("assets/images/bookmark.png"),height: 35,),
                  title: Text(item.url),
                  subtitle: Text(item.desc),
                  trailing: Image(image:
                  AssetImage("assets/images/swap.png"),height: 25,),
                    shape:UnderlineInputBorder(
                        borderSide:BorderSide(color: Colors.black54)
                    )
                ),
              )
              ),
            ),
          ),
        ],),
      )),
    /// create bookmarks
    floatingActionButton: InkWell(
      onTap: () async{
        await showDialog(
            context: context,
            builder: (_) => AlertdialogWidget(type: "Bookmark",
                  method: "Create",
                  id: "",
                folderId:widget.folder_id)

        );

        await loadData();


      },
      child:  Image(image:
      AssetImage("assets/images/add_bookmark.png"),height: 40,),
    )
    );
  }
}
