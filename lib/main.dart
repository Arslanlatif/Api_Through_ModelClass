import 'package:flutter/material.dart';
import 'package:get_put_api/ApiProvider.dart';
import 'package:get_put_api/ModelClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  APIPhotos apiPhotos = APIPhotos();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('APIS'),
        ),
        body: FutureBuilder<List<ModelClass>>(
          future: apiPhotos.fatchPhotos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 1,
                  value: 0.6,
                  color: Colors.black,
                ));
              case ConnectionState.none:
                return const Text('Click to load Data');
              default:
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          Image.network(snapshot.data![index].url.toString()),
                      title: Text(snapshot.data![index].id.toString()),
                      subtitle: Text(snapshot.data![index].title.toString()),
                      trailing: Image.network(
                          snapshot.data![index].thumbnailUrl.toString()),
                    );
                  },
                );
            }
          },
        ));
  }
}
