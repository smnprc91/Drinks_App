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
      ),
      leading: Icon(
        widget.icon,
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.routeName));
      },
    );
  }
}
