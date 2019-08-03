import 'dart:async';

import 'package:flutteruiapp/homepage/menu_view_model.dart';
import 'package:flutteruiapp/homepage/menu.dart';

class MenuBloc {
  final _menuVM = MenuViewModel();
  final menuController = StreamController<List<Menu>>();

  Stream<List<Menu>> get menuItems => menuController.stream;

  MenuBloc() {
    menuController.add(_menuVM.getMenuItems());
  }
}
