import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/model/folder/folder_model.dart';

import '../../../common/custom_widegt/alertDialog_widget.dart';
import '../../../network/network_api.dart';
import '../../bookmarks/screen/bookmarks_screen.dart';
import '../../auth/screen/login_screen.dart';

class FolderScreenCopy extends StatefulWidget {
  const FolderScreenCopy({super.key});

  @override
  State<FolderScreenCopy> createState() => _FolderScreenCopyState();
}

class _FolderScreenCopyState extends State<FolderScreenCopy> {
  final api = NetworkApi();

  List<FolderModel> allFolder = [];
  bool isLoading = false;
  bool? error;

  String _query = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() => isLoading = true);
    try {
      final box = GetStorage();
      allFolder = await api.folderObj.getAllFolders();
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> _logout() async {
    try {
      final box = GetStorage();
      await box.remove('token');

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logged out')));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Logout failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _query.isEmpty
        ? allFolder
        : allFolder
              .where(
                (f) =>
                    (f.name ?? '').toLowerCase().contains(_query.toLowerCase()),
              )
              .toList();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 40),
            ListTile(
              title: const Text("Log out"),
              leading: const Icon(Icons.logout),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: loadData,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const Text("Folders", style: TextStyle(fontSize: 30)),
                  const SizedBox(height: 12),

                  TextField(
                    onChanged: (v) => setState(() => _query = v),
                    decoration: const InputDecoration(
                      hintText: 'Search by folder name…',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (allFolder.isEmpty && _query.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'Pull down to refresh',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  else if (_query.isNotEmpty && items.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'No results',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  else
                    ...items.map(
                      (item) => Column(
                        children: [
                          Slidable(
                            key: ValueKey(item.id),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) async {
                                    await showDialog(
                                      context: context,
                                      builder: (_) => AlertdialogWidget(
                                        type: "Folder",
                                        method: "Update",
                                        id: item.id.toString(),
                                        folderId: "",
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
                                    await api.folderObj.deleteFolders(
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
                              leading: const Icon(Icons.folder),
                              title: Text(item.name),
                              trailing: const Icon(Icons.swap_horiz),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        BookmarksScreen(folder_id: item.id),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(height: 1, color: Colors.black12),
                        ],
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
              type: "Folder",
              method: "Create",
              id: "",
              folderId: "",
            ),
          );
          await loadData();
        },
        child: const Icon(Icons.folder_copy),
      ),
    );
  }
}
