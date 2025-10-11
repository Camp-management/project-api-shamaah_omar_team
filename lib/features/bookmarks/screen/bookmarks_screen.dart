import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_notes/model/bookmarks/bookmarks_model/bookmarks_model.dart';
import 'package:smart_notes/network/network_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/custom_widegt/alertDialog_widget.dart';

class BookmarksScreen extends StatefulWidget {
  final dynamic folderId;

  const BookmarksScreen({super.key, required this.folderId});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final api = NetworkApi();
  final box = GetStorage();
  List<BookmarksModel> allBookmarks = [];
  bool isLoading = false;
  Map<String, bool> checkedMap = {};
  String get _storageKey => 'checked_bookmarks_${widget.folderId}';
  bool _isChecked(dynamic id,bool is_ticked) => checkedMap['$id'] == is_ticked;
  Future<void> _toggleChecked(dynamic id) async {
    final key = '$id';
    setState(() => checkedMap[key] = !(checkedMap[key] ?? false));
    await box.write(_storageKey, checkedMap);
  }

  String _query = '';

  @override
  void initState() {
    super.initState();
    _loadCheckedMap();
    loadData();
  }

  void _loadCheckedMap() {
    final raw = box.read<Map>(_storageKey);
    if (raw != null) {
      checkedMap = raw.map((k, v) => MapEntry(k.toString(), v == true));
    }
  }

  /// load bookmarks list
  Future<void> loadData() async {
    setState(() => isLoading = true);
    try {
      allBookmarks = await api.bookmarksMethod.getBookmarksByFolder(
        id: widget.folderId,
      );
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> _openUrl(BuildContext context, String raw) async {
    final normalized = raw.startsWith('http') ? raw : 'https://$raw';
    final uri = Uri.parse(normalized);

    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to open link: $e')));
      }
    }
  }

  IconButton _buildTrailing(dynamic id,bool is_ticked) {
    final checked =  _isChecked(id,is_ticked);
    return IconButton(
      onPressed: () => _toggleChecked(id),
      tooltip: checked ? 'Uncheck' : 'Check',
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: checked
            ? const Icon(Icons.check_circle, key: ValueKey('on'))
            : const Icon(Icons.radio_button_unchecked, key: ValueKey('off')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _query.isEmpty
        ? allBookmarks
        : allBookmarks
              .where(
                (b) => (b.url).toString().toLowerCase().contains(
                  _query.toLowerCase(),
                ),
              )
              .toList();

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
                  TextField(
                    onChanged: (v) => setState(() => _query = v),
                    decoration: const InputDecoration(
                      hintText: 'Search by URL…',
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
                  else if (allBookmarks.isEmpty && _query.isEmpty)
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
                    ...items.map( /// show list of bookmarks and  slide to update or delete
                      (item) => Slidable(
                        key: ValueKey(item.id),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction( /// update
                              onPressed: (_) async {
                                await showDialog(
                                  context: context, /// show dialog to update data
                                  builder: (_) => AlertdialogWidget(
                                    type: "Bookmark",
                                    method: "Update",
                                    id: item.id.toString(),
                                    folderId: widget.folderId,
                                  ),
                                );
                                await loadData();
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.archive,
                              label: 'Edit',
                            ),
                            SlidableAction( /// delete the bookmark
                              onPressed: (_) async { /// call delete api
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
                        child: ListTile( /// show bookmark details
                          onTap: () => _openUrl(context, item.url),
                          leading: const Image(
                            image: AssetImage("assets/images/bookmark.png"),
                            height: 35,
                          ),
                          title: Text(item.url),
                          subtitle: Text(item.desc),
                          trailing: _buildTrailing(item.id,item.is_ticked),
                          shape: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
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
      floatingActionButton: InkWell(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (_) => AlertdialogWidget(
              type: "Bookmark",
              method: "Create",
              id: "",
              folderId: widget.folderId,
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
