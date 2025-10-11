import 'dart:math' as math;
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

  // persisted checkmarks per folder
  Map<String, bool> checkedMap = {};
  String get _storageKey => 'checked_bookmarks_${widget.folderId}';
  bool _isChecked(dynamic id, bool isTickedFromApi) =>
      checkedMap['$id'] ?? isTickedFromApi;

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

  /// ---------- Pretty tile helpers ----------

  String _domainOf(String url) {
    final u = url.trim();
    final normalized = u.startsWith('http') ? u : 'https://$u';
    try {
      final host = Uri.parse(normalized).host;
      return host.replaceFirst('www.', '');
    } catch (_) {
      return u;
    }
  }

  // nice gradients to randomize a bit per row
  List<List<Color>> get _gradients => const [
    [Color(0xFF5EE7DF), Color(0xFFB490CA)], // teal → purple
    [Color(0xFFFF9A9E), Color(0xFFFAD0C4)], // pink → peach
    [Color(0xFFA18CD1), Color(0xFFFBC2EB)], // lavender → rose
    [Color(0xFF84FAB0), Color(0xFF8FD3F4)], // mint → sky
    [Color(0xFFFFDEE9), Color(0xFFB5FFFC)], // blush → aqua
  ];

  Widget _favicon(String url) {
    final domain = _domainOf(url);
    final src = 'https://www.google.com/s2/favicons?domain=$domain&sz=64';
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        src,
        height: 28,
        width: 28,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 28,
          width: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.public, size: 16),
        ),
      ),
    );
  }

  Widget _checkmark(bool checked, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: checked ? Colors.green.withOpacity(.14) : Colors.white10,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: checked ? Colors.green : Colors.black12,
            width: checked ? 1.4 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: checked
                  ? const Icon(
                      Icons.check_circle,
                      key: ValueKey('on'),
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.radio_button_unchecked,
                      key: ValueKey('off'),
                      color: Colors.black38,
                    ),
            ),
            const SizedBox(width: 6),
            Text(
              checked ? 'Saved' : 'Save',
              style: TextStyle(
                fontSize: 12,
                color: checked ? Colors.green.shade700 : Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookmarkCard(BookmarksModel item, int index) {
    final domain = _domainOf(item.url);
    final gradient = _gradients[index % _gradients.length];
    final checked = _isChecked(item.id, item.is_ticked);

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 240),
      tween: Tween(begin: 1, end: 1),
      builder: (context, scale, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
            // nice subtle gradient border effect
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient.map((c) => c.withOpacity(.18)).toList(),
            ),
          ),
          child: Material(
            color: Colors.white,
            elevation: 0,
            borderRadius: BorderRadius.circular(22),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () => _openUrl(context, item.url),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // left accent + favicon
                    Container(
                      width: 6,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _favicon(item.url),
                    const SizedBox(width: 12),

                    // middle: url + desc + domain chip
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // URL line
                          Text(
                            item.url,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          // desc line
                          Text(
                            item.desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(.65),
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // domain chip
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.04),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.link, size: 14),
                                const SizedBox(width: 6),
                                Text(
                                  domain,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // right: animated check control
                    _checkmark(checked, () => _toggleChecked(item.id)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  IconButton _actionIcon(IconData icon, Color color, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(.1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: color),
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
                  // search
                  TextField(
                    onChanged: (v) => setState(() => _query = v),
                    decoration: InputDecoration(
                      hintText: 'Search by URL…',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(.03),
                    ),
                  ),
                  const SizedBox(height: 16),

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
                    ...items.asMap().entries.map((e) {
                      final item = e.value;
                      final idx = e.key;

                      // Keep your Slidable actions, but wrap our fancy card
                      return Slidable(
                        key: ValueKey(item.id),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: .42,
                          children: [
                            SlidableAction(
                              onPressed: (_) async {
                                await showDialog(
                                  context: context,
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
                              icon: Icons.edit,
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
                        child: _bookmarkCard(item, idx),
                      );
                    }),
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
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7F7FD5), Color(0xFF86A8E7), Color(0xFF91EAE4)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.add, size: 28, color: Colors.white),
        ),
      ),
    );
  }
}
