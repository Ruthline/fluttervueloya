import 'package:flutter/material.dart'; // cosas de dart

//metodo principal
void main(){
  runApp(const VueloYa());
}


//widget inmutable no maneja un estado de manera nativa
class VueloYa extends StatelessWidget {
  const VueloYa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //Quita la marquilla que aparece en el simulador
      home: MyFirstWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {//build es el encargado de mostrar widgets, ya sea por metodo o por clase, etc.
    return Container(
      color: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              color: Colors.lightGreen,
              child:Padding(
                padding: const EdgeInsets.only(top: 255, bottom:255, left: 40, right: 40), child: Container(
                  color: Colors.amber,
                  ),
              )
            ),
          ),
        ),
        )
    );
  }
}