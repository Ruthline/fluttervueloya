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
        print('Jelou Print');
      }, child: const Icon(Icons.call)),
      body: Center(
        child:AspectRatio(
          aspectRatio: 1.0,
          child: Container(
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
                  ),
                )),
              ),
            ),
            ),
        )
      ),
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
      Divider(color: Colors.grey),
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