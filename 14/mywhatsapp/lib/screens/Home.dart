import 'package:flutter/material.dart';
import 'Calls.dart';
import 'Camera.dart';
import 'Chat.dart';
import 'Status.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            Tab(
              child: Text(
                "CHATS",
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Tab(
              child: Text(
                "STATUS",
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Tab(
              child: Text(
                "CALLS",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camera(),
          Chat(),
          Status(),
          Calls(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.camera,
                color: Colors.white,
              ),
            )
          : _tabController.index == 1
              ? FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                )
              : _tabController.index == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 45.0,
                          width: 45.0,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Theme.of(context).accentColor,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  : FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Theme.of(context).accentColor,
                      child: Icon(
                        Icons.add_call,
                        color: Colors.white,
                      ),
                    ),
    );
  }
}
