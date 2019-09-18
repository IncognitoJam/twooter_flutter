import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _pages = [
    ['Home', HomePage(), null],
    ['Search', SearchPage(), null],
    [
      'Notifications',
      NotificationsPage(),
      [
        IconButton(icon: Icon(Icons.settings), onPressed: () {}),
      ]
    ],
    ['Messages', MessagesPage(), null],
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twooter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => _scaffoldKey.currentState.openDrawer(),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/17/28/db/1728db274993e2358445d442800eed2f.jpg',
                ),
              ),
            ),
          ),
          title: Text(
            _pages[_selectedIndex][0],
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actionsIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor),
          actions: _pages[_selectedIndex][2],
        ),
        body: _pages[_selectedIndex][1],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/17/28/db/1728db274993e2358445d442800eed2f.jpg',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Cameron Clough',
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        '@cameronjclough',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Coming soon!'),
                )),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {},
          tooltip: 'Compose',
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              title: Text('Messages'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final _entries = [
    {
      'author': {
        'name': 'Cameron Clough',
        'tag': '@cameronjclough',
        'profile_picture':
            'https://i.pinimg.com/originals/17/28/db/1728db274993e2358445d442800eed2f.jpg',
      },
      'message': {
        'text': 'Hello, World!',
      },
      'statistics': {
        'replies': '35',
        'retwoots': '432',
        'favourites': '1987',
      },
    },
    {
      'author': {
        'name': 'Cameron Clough',
        'tag': '@cameronjclough',
        'profile_picture':
            'https://i.pinimg.com/originals/17/28/db/1728db274993e2358445d442800eed2f.jpg',
      },
      'message': {
        'text': 'You\'re a mop',
      },
      'statistics': {
        'replies': '0',
        'retwoots': '12',
        'favourites': '14',
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        itemCount: _entries.length,
        itemBuilder: (BuildContext context, int index) {
          final twoot = _entries[index];

          return Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8, left: 8, right: 12),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      twoot['author']['profile_picture'],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Text(
                                twoot['author']['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              '${twoot['author']['tag']} • 5m',
                              style: Theme.of(context)
                                  .textTheme
                                  .body2
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        alignment: Alignment.topLeft,
                        child: Text(
                          twoot['message']['text'],
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              icon: Icon(Icons.message),
                              label: Text(twoot['statistics']['replies']),
                              onPressed: () {},
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.reply, color: Colors.green),
                              label: Text(
                                twoot['statistics']['retwoots'],
                                style: TextStyle(color: Colors.green),
                              ),
                              onPressed: () {},
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.favorite, color: Colors.red),
                              label: Text(
                                twoot['statistics']['favourites'],
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Search'),
        ],
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Notifications'),
        ],
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Messages'),
        ],
      ),
    );
  }
}
