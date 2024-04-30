import 'package:flutter/material.dart'; // cosas de dart
import 'dart:math' as Math;

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
    return _drawerWidget(context);
  }

  Scaffold _drawerWidget(BuildContext context) {
    return _bodyWidget(context);
  }

  Scaffold _bodyWidget(BuildContext context) {
    return _floatingButtonWidget(context);
  }

  Scaffold _floatingButtonWidget(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.blueAccent,
  title: const Text ('VueloYA'),
  actions: const [
    Padding(padding: EdgeInsets.all(5), child: Icon(Icons.person),),
    Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.login),)

    ]
),

drawer: Drawer(
  child:SingleChildScrollView(
    child: Column(
      crossAxisAlignment:  CrossAxisAlignment.stretch,
    children: [
      _headerDrawer(context),
      _menuDrawer(context), 
    ],),
  )
),

floatingActionButton: FloatingActionButton(onPressed: () {
}, child: const Icon(Icons.call)),
body: _boddyWidget(),
);
  }

  Center _boddyWidget() {
    return Center(
child:AspectRatio(
  aspectRatio: 1.0,
  child: Container(
    decoration: const BoxDecoration(color: Color.fromARGB(255, 206, 215, 206)),
    foregroundDecoration: const BoxDecoration(
      backgroundBlendMode: BlendMode.colorBurn,
      gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors:[
          Color.fromARGB(170, 118, 117, 124),
          Color.fromARGB(0, 141, 115, 115),
          Color.fromARGB(170, 180, 174, 187),
        ]
              )
    ),
    child: Center(
      child: Transform.rotate(
        angle: 180/Math.pi,
        child: Container(
          width:250,
          height: 250, 
          decoration: BoxDecoration(color: Colors.purple,boxShadow: [
            BoxShadow(color: Colors.deepPurple.withBlue(120), spreadRadius: 4,blurRadius: 15,offset: Offset.fromDirection(1.0, 30))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: _buildCircleContainer(),
          ),
        ),
      ),
    ),

)),
    );
  }

  Widget _buildCircleContainer(){
    return Container(
      decoration:const BoxDecoration(
        shape:BoxShape.circle,gradient: RadialGradient(colors:[
          Colors.lightBlueAccent, Colors.blueAccent
        ],
        center: Alignment(-0.3, -0.5)),
        boxShadow: [BoxShadow(blurRadius: 20)]),
    );
  }

  Material _headerDrawer(BuildContext context) {
    return Material(
            color:Colors.blueGrey,
            child: InkWell(
              child: Container(
                padding: EdgeInsets.only(
                  top:MediaQuery.of(context).padding.top, bottom: 24
                ),
                child:const Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                    backgroundImage: AssetImage('assets/Breadog.jpg'),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Bread Dog', style: TextStyle(
                      fontSize: 28,
                      color: Colors.white
                    ), )
                    ],

                )
              ),
            ),
          );
  }
  
  Widget _menuDrawer(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: const Icon(Icons.house),
        title: const Text('Inicio'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.airplane_ticket),
        title: const Text('Reservas'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.price_change),
        title: const Text('Descuento en vuelos'),
        onTap: () {},
      ),
      
      ListTile(
        leading: const Icon(Icons.travel_explore),
        title: const Text('Lugares de interes'),
        onTap: () {},
      ),
      const Divider(color: Colors.grey),
      ListTile(
        leading: const Icon(Icons.handshake),
        title: const Text('Nosotros'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.call),
        title: const Text('Contactanos'),
        onTap: () {},
      ),
    ],
    );
  }
}