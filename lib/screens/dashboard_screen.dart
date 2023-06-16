import 'package:flutter/material.dart';
import 'package:productos_app/providers/money_provider.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final MoneyProvider moneyProvider = MoneyProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Dashbutton(nombre: 'Deposito', ruta: 'deposito'),
            const SizedBox(
              height: 30,
            ),
            const Dashbutton(nombre: 'Retiro', ruta: 'retiro'),
            const SizedBox(
              height: 30,
            ),
            const Dashbutton(nombre: 'Salir', ruta: 'login'),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                onPressed: () {
                   showDialog(context: context, builder: (BuildContext context) {
                     return AlertDialog(
                       title: const Text('Saldo'),
                       content: Text('Tu saldo es de: ${moneyProvider.money}'),
                       actions: [
                         TextButton(onPressed: () => Navigator.pop(context), child: const Text('Ok'))
                       ],
                     );
                   });
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text(
                    'Saldo',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

class Dashbutton extends StatelessWidget {
  const Dashbutton({
    Key? key,
    required this.nombre,
    required this.ruta,
  }) : super(key: key);

  final String nombre;
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (ruta == 'login') {
          Navigator.pushReplacementNamed(context, ruta);
        } else {
          Navigator.pushNamed(context, ruta);
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.green,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(
          nombre,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
