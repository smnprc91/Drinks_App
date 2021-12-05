import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem(
      {Key? key, required this.name, required this.icon, this.routeName})
      : super(key: key);

  final String name;
  final IconData icon;
  final String? routeName;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool _isCurrentRoute(BuildContext context) {
    return ModalRoute.of(context)!.settings.name == widget.routeName &&
        widget.routeName != null;
  }

  bool _navigationIsAllowed(BuildContext context) {
    return !_isCurrentRoute(context) && widget.routeName != null;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ListTile(
      title: Text(widget.name,
          style: _isCurrentRoute(context)
              ? TextStyle(color: theme.primaryColor)
              : null),
      leading: Icon(widget.icon,
          color: _isCurrentRoute(context) ? theme.primaryColor : null),
      onTap: () {
        if (_navigationIsAllowed(context)) {
          
            Navigator.pop(context);
          Navigator.of(context).pushNamedAndRemoveUntil(widget.routeName!,
              (Route<dynamic> route) => !route.hasActiveRouteBelow);
        } else {
          if (widget.routeName == null) {
            SystemNavigator.pop();
          } else {
            Navigator.pop(context);
          }
        }
      },
    );
  }
}
