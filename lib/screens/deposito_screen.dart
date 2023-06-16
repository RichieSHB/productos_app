
import 'package:flutter/material.dart';
import 'package:productos_app/providers/money_provider.dart';

class DepositoScreen extends StatelessWidget {
  DepositoScreen({Key? key}) : super(key: key);

  final MoneyProvider moneyProvider = MoneyProvider();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cantidad a depositar',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(onPressed: () {
            moneyProvider.addMoney(double.parse(_controller.text));
            Navigator.pushReplacementNamed(context, 'dashboard');
          }, child: const Text('Depositar'),)
        ]),
      ),
    );
  }
}
