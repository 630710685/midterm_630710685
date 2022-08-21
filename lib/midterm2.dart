import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'midterm1.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();
  var _feedbacktext = '' ;
  var showtestbottom = false;


  void handleClickGuess() {
    showtestbottom = !showtestbottom;
    print('Button clicked!');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      print('Input error');
      setState(() {
        _feedbacktext = 'Input error';
      });
    } else {
      var result = _game.doGuess(guess);

      if (result == Result.correct) {

        setState(() {

          _feedbacktext = 'Celsius to Fahrenheit';
        });
        print(Result.correct) ;
      }  else if ( result == Result.correct) {

        setState(() {
          _feedbacktext = 'Celsius to Kelvin ';
        });
        print('Celsius to Kelvin');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Midterm Exam'),
      ),

      body: Center(
      child: Container(
      decoration: BoxDecoration(
      color: Colors.white, //สีพื้นหลังของ Container
      border: Border.all(
      width: 5.0,
      color: Colors.deepPurple.shade200,
      ),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
      BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3),
      ),
      ],
      ),


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

              const Text('Temperature Converter'),




            SizedBox(width: 100.0, height: 200.0),




            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a temperature value to convert',
              ),
            ),

            Text(' '),
            // Callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Celsius to Fahrenheit'),
            ),Text(' '),
            ElevatedButton(onPressed: handleClickGuess,
                child: const Text('Celsius to Kelvin')
            ),Text(' '),
            ElevatedButton(onPressed: handleClickGuess,
                child: const Text('Fahrenheit to Celsius')
            ),Text(' '),
            ElevatedButton(onPressed: handleClickGuess,
                child: const Text('Fahrenheit to Kelvin')
            ),Text(' '),
            ElevatedButton(onPressed: handleClickGuess,
                child: const Text('Kelvin to Celsius')
            ),Text(' '),
            ElevatedButton(onPressed: handleClickGuess,
                child: const Text('Kelvin to Fahrenheit')
            ),
            Text(' '),
            Text(_feedbacktext),


            //OutlinedButton(onPressed: null, child: Text('TEST'),),


          ],
      ),

        ),
      ),
    );
  }
}
