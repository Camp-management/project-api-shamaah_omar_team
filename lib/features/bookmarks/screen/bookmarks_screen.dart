import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smart_notes/model/bookmarks/bookmarks_model/bookmarks_model.dart';
import 'package:smart_notes/network/network_api.dart';

import '../../../common/custom_widegt/alertDialog_widget.dart';

class BookmarksScreen extends StatefulWidget {
  final dynamic folder_id;

  const BookmarksScreen({super.key, required this.folder_id});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  var api = NetworkApi();

  List<BookmarksModel> allBookmarks = [];
  bool? error;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    allBookmarks = await api.bookmarksMethod.getBookmarksByFolder(
      id: widget.folder_id,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Bookmarks"),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Text("Bookmarks for: ${widget.folder_id}"),
                  ...allBookmarks.map(
                    (item) => InkWell(
                      onTap: () {
                        // navigate to details if needed
                      },
                      child: Slidable(
                        key: ValueKey(item.id),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (_) async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => AlertdialogWidget(
                                    type: "Bookmark",
                                    method: "Update",
                                    id: item.id.toString(),
                                    folderId: widget.folder_id,
                                  ),
                                );
                                await loadData();
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.archive,
                              label: 'Edit',
                            ),
                            SlidableAction(
                              onPressed: (_) async {
                                await api.bookmarksMethod.deleteBookmarks(
                                  id: item.id.toString(),
                                );
                                await loadData();
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: const Image(
                            image: AssetImage("assets/images/bookmark.png"),
                            height: 35,
                          ),
                          title: Text(item.url),
                          subtitle: Text(item.desc),
                          trailing: const Image(
                            image: AssetImage("assets/images/swap.png"),
                            height: 25,
                          ),
                          shape: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (allBookmarks.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'Pull down to refresh',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (_) => AlertdialogWidget(
              type: "Bookmark",
              method: "Create",
              id: "",
              folderId: widget.folder_id,
            ),
          );
          await loadData();
        },
        child: const Image(
          image: AssetImage("assets/images/add_bookmark.png"),
          height: 40,
        ),
      ),
    );
  }
}
