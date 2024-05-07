import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  final TextEditingController _numberOneTEController = TextEditingController();
  final TextEditingController _numberTwoTEController = TextEditingController();
  double _result =0.0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          IconButton(onPressed: (){
            _numberTwoTEController.clear();
            _numberOneTEController.clear();
          }, icon: const Icon(Icons.repeat_outlined),iconSize: 35,),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _numberOneTEController,
              decoration: const InputDecoration(
                hintText: 'Number 1',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _numberTwoTEController,
              decoration: const InputDecoration(
                hintText: 'Number 2',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 14,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(onPressed: (){
                _add();
              }, icon: const Icon(Icons.add),label: const Text('Add'),),
              ElevatedButton.icon(onPressed: (){
                _sud();
              }, icon: const Icon(Icons.remove),label: const Text('Sud'),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(onPressed: (){
                _div();
              }, icon: const Icon(Icons.safety_divider),label: const Text('Div'),),
              ElevatedButton.icon(onPressed: (){
                _mul();
              }, icon: const Icon(Icons.star_outline),label: const Text('Mul'),),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Result:$_result',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        ],
      ),
    );
  }

  void _add(){
    double numOne= double.tryParse(_numberOneTEController.text) ?? 00;
    double numTwo= double.tryParse(_numberTwoTEController.text) ?? 00;

    _result = numOne+numTwo;
    setState(() {

    });
}

  void _sud(){
    double numOne= double.tryParse(_numberOneTEController.text) ?? 00;
    double numTwo= double.tryParse(_numberTwoTEController.text) ?? 00;

    _result = numOne-numTwo;
    setState(() {

    });
  }

  void _div(){
    double numOne= double.tryParse(_numberOneTEController.text) ?? 00;
    double numTwo= double.tryParse(_numberTwoTEController.text) ?? 00;

    _result = numOne/numTwo;
    setState(() {

    });
  }

  void _mul(){
    double numOne= double.tryParse(_numberOneTEController.text) ?? 00;
    double numTwo= double.tryParse(_numberTwoTEController.text) ?? 00;

    _result = numOne*numTwo;
    setState(() {

    });
  }
@override
  void dispose() {
    _numberTwoTEController.dispose();
    _numberOneTEController.dispose();
    _numberOneTEController.clear();
    _numberTwoTEController.clear();
    super.dispose();
  }
}

