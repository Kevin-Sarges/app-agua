import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/button_app_widget.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nome e Contato'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              const Text(
                'Informe seu nome número para o entregador entra em contato com você caso seja necessario',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 54,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Somente nome e sobrenome'),
                          hintText: 'Ex: Kevin Sarges'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Número para contato'),
                        hintText: 'Ex: 984279843',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonAppWidget(
                onPressed: () {},
                text: const Text(
                  'Salvar informações',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.blueDarck,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 96,
                    vertical: 9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
