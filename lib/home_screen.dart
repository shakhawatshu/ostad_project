import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassInputCountTEController= TextEditingController(text:'1');
  int _count= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Today\'s Water Consume count: $_count', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 12,),
                  const Text('Tap here to Count Water Consume', style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,
                        border: Border.all(color: Colors.amberAccent,width: 10,)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Icon(Icons.water_drop_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    width: 70,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _glassInputCountTEController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Text('History',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const Divider(
              height: 22,
              color: Colors.grey,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Time'),
                  leading: CircleAvatar(
                    child: Text('${index+1}'),
                  ),
                  trailing: Text('1'),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
