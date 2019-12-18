import 'package:flutter/material.dart';
import 'package:my_thai_star_flutter/blocs/localization_bloc.dart';
import 'package:my_thai_star_flutter/router.dart';

///Global [Drawer] that helps navigate to the 3 main pages of the App.
///
///Navigation to: Home, Menu and Book Table - Pages
class AppDrawer extends StatelessWidget {
  static const double _topMargin = 30;

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context).settings.name;
    return Drawer(
      child: ListTileTheme(
        selectedColor: Theme.of(context).accentColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: _topMargin),
            _DrawerObject(
              title: LocalizationBloc.of(context).get("main/home"),
              icon: Icons.home,
              selected: currentRoute == Router.home,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Router.home,
                (Route<dynamic> route) => false,
              ),
            ),
            _DrawerObject(
              title: LocalizationBloc.of(context).get("main/book"),
              icon: Icons.bookmark,
              selected: currentRoute == Router.booking,
              onTap: () => Navigator.pushNamed(context, Router.booking),
            ),
            _DrawerObject(
              title: LocalizationBloc.of(context).get("main/menu"),
              icon: Icons.restaurant_menu,
              selected: currentRoute == Router.menu,
              onTap: () => Navigator.pushNamed(context, Router.menu),
            ),
          ],
        ),
      ),
    );
  }
}

///One item in the [AppDrawer]
class _DrawerObject extends StatelessWidget {
  static const double _iconSize = 30;
  final String _title;
  final bool _selected;
  final IconData _icon;
  final VoidCallback _onTap;

  const _DrawerObject({
    @required title,
    icon = Icons.error,
    @required onTap,
    @required selected,
  })  : _title = title,
        _icon = icon,
        _onTap = onTap,
        _selected = selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: _selected,
      leading: Icon(_icon, size: _iconSize),
      title: Text(_title, style: Theme.of(context).textTheme.title),
      onTap: _onTap,
    );
  }
}
