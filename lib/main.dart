import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(
        20,
            (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
        ),
      ),
    ),
  ));
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabListPage(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class TabListPage extends StatelessWidget {

  Widget _getElem(String title, bool isGray, String value) {
    return Container(
      color: isGray ? Colors.grey[200] : Colors.white,
      child:
      ListTile(
        leading: Text(title, textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16.0),),
        title: Text(value, textAlign: TextAlign.right, style: TextStyle(fontSize: 16.0),),
        //subtitle: Text('number', textAlign: TextAlign.right,style: TextStyle(fontSize: 16.0),),
        //trailing: Icon(Icons.create),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute
        .of(context)
        .settings
        .arguments;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            TabBar(
              tabs: [
                //Tab(child: Text("タブ1", style: TextStyle(color: Colors.black))),
                //Tab(child: Text("タブ2", style: TextStyle(color: Colors.black))),
                Tab(child: Text("タブ1", style: TextStyle(color: Colors.black))),
                Tab(child: Text("タブ2", style: TextStyle(color: Colors.black))),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                /*
                ListView.separated(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("アイテム${index.toString()}"));
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
                ListView.separated(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("アイテム${index.toString()}"));
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
                 */
                ListView(
                    children: <Widget>[
                      _getElem('Polling Address', false, 0.toString()),
                      _getElem('Hart Version', true, 0.toString()),
                      _getElem('Manufactureer ID', false, 0.toString()),
                      _getElem('Expanded Device Type', true, 0.toString()),
                      _getElem('Device Revision', false, 0.toString()),
                      _getElem('Software Revision', true, 0.toString()),
                      _getElem('Device ID', false, 0.toString()),
                      _getElem('Coufiguration Change Counter', true, 0.toString()),
                      _getElem('Min.Number of Preambles (Response)', false, 0.toString()),
                      _getElem('Loop Current Mode', true, 'Enabled'),
                    ]
                ),
                ListView(
                    children: <Widget>[
                      _getElem('Tag', false, 0.toString()),
                      _getElem('Long Tag', true, 0.toString()),
                      _getElem('Message', false, 0.toString()),
                      _getElem('Descriptor', true, 0.toString()),
                      _getElem('Date Code', false, 0.toString()),
                      _getElem('Transducer Serial Number', true, 0.toString()),
                      _getElem('Transducer Unit Code', false, 0.toString()),
                      _getElem('Upper Transducer Limit', true, 0.toString()),
                      _getElem('Lower Transducer Limit', false, 0.toString()),
                      _getElem('Minimum Span', true, 0.toString()),
                      _getElem('PV Alarm Selection Code', false, 'Enabled'),
                      _getElem('PV Transfer Function Code', true, 'Enabled'),
                      _getElem('PV Range Unit', false, 'Enabled'),
                      _getElem('PV Upper Range Value', true, 'Enabled'),
                      _getElem('PV Lower Range Value', false, 'Enabled'),
                      _getElem('PV Damping Value', true, 'Enabled'),
                      _getElem('Write Protect Code', false, 'Enabled'),
                      _getElem('PV Analog Channel Flag', true, 'Enabled'),
                      _getElem('Final Assembly Number', false, 'Enabled'),
                    ]
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
