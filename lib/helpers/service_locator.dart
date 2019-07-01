import 'package:everything_flutter/scoped_model/dashboard.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register services

  // Register models
  locator.registerFactory<DashboardModel>(() => DashboardModel());
}
