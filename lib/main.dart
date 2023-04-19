import 'package:flutter/material.dart';

var dataObjects = [
  {"name": "Ethiopia Yirgacheffe", "country": "Ethiopia", "intensity": 4},
  {"name": "Colombia Supremo", "country": "Colombia", "intensity": 3},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
  {"name": "Sumatra Mandheling", "country": "Indonesia", "intensity": 5},
];

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyTileWidget extends StatelessWidget {
  final List<Map<String, dynamic>> dataObjects;

  MyTileWidget({required this.dataObjects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataObjects.length,
      itemBuilder: (context, index) {
        final data = dataObjects[index];
        return Card(
          child: ListTile(
            title: Text(data["name"]),
            subtitle: Text("${data["style"]} - IBU ${data["ibu"]}"),
            trailing: Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: DataBodyWidget(
            objects: dataObjects,
            columnNames: ["Nome", "País de origem", "Intensidade"],
            propertyNames: ["name", "country", "intensity"],
          ),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataBodyWidget({
    required this.objects,
    required this.columnNames,
    required this.propertyNames,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: columnNames.map((name) {
          return DataColumn(
            label: Expanded(
              child: Text(
                name,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          );
        }).toList(),
        rows: objects.map((obj) {
          return DataRow(
            cells: propertyNames.map((propName) {
              return DataCell(
                Text(obj[propName].toString()),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
