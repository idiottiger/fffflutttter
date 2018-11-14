import 'package:flutter/material.dart';

class _Item {
  final String text;
  final int index;
  _Item(this.text, this.index);
}

class _ItemView extends StatelessWidget {
  final _Item item;
  _ItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.item.text),
      enabled: this.item.index % 2 == 0,
    );
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10),
      children: createList(context),
    );
  }

  List<Widget> createList(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < 100; i++) {
      var item = _Item('hello_' + i.toString(), i);
      list.add(_ItemView(item));
    }

    return ListTile.divideTiles(
            context: context, tiles: list, color: Colors.purple)
        .toList();
  }
}
