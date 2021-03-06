import 'package:flutter/material.dart';
import 'package:news_app/home_tabs/favourites.dart';
import 'package:news_app/home_tabs/popular.dart';
import 'package:news_app/home_tabs/whats_new.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
// import '../shared_ui/navigation_drawer.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  TabController _tabController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Explore"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            // IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            _popOutMenu(context),

          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "WHAT'S NEW",
              ),
              Tab(
                text: "POPULAR",
              ),
              Tab(
                text: "FAVOURITES",
              ),
            ],
            controller: _tabController,
          ),
        ),
      drawer: NavigationDrawer(),
      body: Center(
        child:TabBarView( children: [
          WhatsNew(),
          Popular(),
          Favourites()
        ] , controller: _tabController,  ),
      ),
    );


  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('SETTINGS'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        // TODO :
      },
      icon: Icon(Icons.more_vert),
    );
  }
  }


