import 'package:flutter/material.dart';
import 'package:musopathy/models/faqdata.dart';

class EntryItem extends StatelessWidget {
  final Entry entry;
  const EntryItem(this.entry);
  Widget _buildTile(Entry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(root.title),
      );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map(_buildTile).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(entry);
  }
}
