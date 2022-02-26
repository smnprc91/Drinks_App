import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.routeName})
      : super(key: key);

  final String name;
  final IconData icon;
  final Widget routeName;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.name,
        style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      ),
      leading: Icon(widget.icon, color: Theme.of(context).secondaryHeaderColor),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.routeName));
      },
    );
  }
}
