import 'package:flutter/material.dart';
import 'package:ostad_project/Water_consume_class.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassInputCountTEController= TextEditingController(text:'1');
  List<WaterConsume> waterConsumeList=[];
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
                  Text('Today\'s Water Consume count:${_totalGlassCount()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 12,),
                  const Text('Tap here to Count Water Consume', style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: _addWaterConsume,
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
                      keyboardType: TextInputType.number,
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
                itemCount: waterConsumeList.length,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Text(waterConsumeList[index].time.toString()),
                  leading: CircleAvatar(
                    child: Text('${index+1}'),
                  ),
                  trailing: Text(waterConsumeList[index].glassCount.toString()),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
  //Setter Method(cant return)
  void _addWaterConsume(){
    int glassCount= int.tryParse(_glassInputCountTEController.text)?? 1;
    WaterConsume waterConsume= WaterConsume(time: DateTime.now(), glassCount: glassCount);
    waterConsumeList.add(waterConsume);
    setState(() {

    });

  }
  //Getter Method (can return)
  int _totalGlassCount(){
    int totalCount = 0;
    for(WaterConsume waterConsume in waterConsumeList){
      totalCount += waterConsume.glassCount;
    }
    return totalCount;
  }


}

