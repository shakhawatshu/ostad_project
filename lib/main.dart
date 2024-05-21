import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 50,
        )
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(

          itemCount: 3,
            itemBuilder:(context, index) {
              return ListTile(

                leading: SizedBox(
                    child: Image.network('https://via.placeholder.com/150/92c952',fit: BoxFit.cover,height: 70, width: 70,)),
              title: Wrap(
                spacing: 10,
                children: [
                  Text('accusamus beatae ad facilis cum similique qui sunt')
                ],
              ),
              );
            },
        separatorBuilder: (context, index) => Divider(
          height: 10,
        ),
        ),
      ),
    );
  }
}
