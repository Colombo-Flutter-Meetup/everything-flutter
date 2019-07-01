import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardModel extends Model {
  int _selectedPageIndex = 0;
  BuildContext context;

  void setSelectedPageIndex(int index) {
    _selectedPageIndex = index;
  }

  get getSelectedPageIndex => _selectedPageIndex;

  void setBuildContext(BuildContext context) {
    context = context;
  }

  get getBuildContext => context;
}
