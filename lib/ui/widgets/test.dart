import 'package:everything_flutter/constants/theme_data.dart';
import 'package:everything_flutter/helpers/screen_util.dart';
import 'package:everything_flutter/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:intl/intl.dart';

class Drawer4 extends StatefulWidget {
	@override
	_Drawer4State createState() => _Drawer4State();
}

class _Drawer4State extends State<Drawer4> {
	final menu = new Menu(
		items: [
			new MenuItem(
				id: 'restaurant',
				title: 'EVENTS',
				),
			new MenuItem(
				id: 'other1',
				title: 'WIDGETS',
				),
			new MenuItem(
				id: 'other2',
				title: 'COMMUNITIES',
				),
			new MenuItem(
				id: 'other3',
				title: 'TUTORIALS',
				),
			new MenuItem(
				id: 'other4',
				title: 'SETTINGS',
				),
		],
		);
	
	var selectedMenuItemId = 'restaurant';
	var _widget = Text("1");
	
//	Widget headerView(BuildContext context) {
//		return Column(
//			children: <Widget>[
//				Container(
//					padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
//					child: Row(
//						children: <Widget>[
//							new Container(
//									width: 48.0,
//									height: 48.0,
//									decoration: new BoxDecoration(
//											shape: BoxShape.circle,
//											image: new DecorationImage(
//													fit: BoxFit.fill,
//													image: AssetImage("assets/user1.jpg")))),
//							Container(
//									margin: EdgeInsets.only(left: 16),
//									child: Column(
//										mainAxisAlignment: MainAxisAlignment.start,
//										crossAxisAlignment: CrossAxisAlignment.start,
//										children: <Widget>[
//											Text(
//												"John Witch",
//												style: Theme.of(context)
//														.textTheme
//														.subhead
//														.copyWith(color: Colors.white),
//												),
//											Text(
//												"test123@gmail.com",
//												style: Theme.of(context)
//														.textTheme
//														.subtitle
//														.copyWith(color: Colors.white.withAlpha(200)),
//												)
//										],
//										))
//						],
//						),
//					),
//				Divider(
//					color: Colors.white.withAlpha(200),
//					height: 16,
//					)
//			],
//			);
//	}
	
	@override
	Widget build(BuildContext context) {
		ScreenUtil()..init(context);
		return new DrawerScaffold(
			showAppBar: true,
			percentage: 0.7,
			cornerRadius: 30,
			appBar: _appBar,
			menuView: new MenuView(
				menu: menu,
				headerView: Container(),
				animation: true,
				selectorColor: AppColors.BLUE,
//				mainAxisAlignment: MainAxisAlignment.start,
				color: Colors.black54,
				selectedItemId: selectedMenuItemId,
				onMenuItemSelected: (String itemId) {
					selectedMenuItemId = itemId;
					if (itemId == 'restaurant') {
						setState(() => _widget = Text("1"));
					} else {
						setState(() => _widget = Text("default"));
					}
				},
				),
			contentView: Screen(
				contentBuilder: (context) => HomePage(),
				color: Colors.white,
				),
			contentShadow: [BoxShadow(blurRadius: 50, spreadRadius: 2, color: Colors.white30)],
			);
	}
}


final _appBar = AppBarProps(
	title: _appBarTitle,
	iconTheme: IconThemeData(color: Colors.white),
	elevation: 0,
	brightness: Brightness.light,
	// or use Brightness.dark
	backgroundColor: Colors.black,
	);

final _appBarTitle = Align(
	alignment: Alignment.centerRight,
	child: Text(
		"${DateFormat("MMM d, yyyy").format(DateTime.now())}",
		style: TextStyles.subtitle,
		),
	);

