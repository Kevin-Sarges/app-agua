import 'package:appaguaentregados/app/data/model/model_pedidos.dart';
import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/presenter/view/info/controllers/info_cubit.dart';
import 'package:appaguaentregados/app/presenter/view/info/controllers/info_state.dart';
import 'package:appaguaentregados/app/presenter/view/info/widgets/inputsText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cubit = GetIt.I.get<InfoCubit>();

  final _textControllerName = TextEditingController();
  final _textControllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nome e Contato'),
          backgroundColor: ColorsApp.bluePrimary,
        ),
        body: BlocListener<InfoCubit, InfoState>(
          listener: (context, state) {
            if (state is InfoSucess) {
              Navigator.pushNamed(context, RoutesApp.map);
              return;
            }
          },
          bloc: cubit,
          child: Container(
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
                      InputText(
                        controller: _textControllerName,
                        labelInput: const Text('Somente nome e sobrenome'),
                        hintText: 'Ex: Kevin Sarges',
                      ),
                      InputText(
                        controller: _textControllerPhone,
                        labelInput: const Text('Número para contato'),
                        hintText: 'Ex: 984279843',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonAppWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.salvarContato(
                        ModelPedidos(
                          nomeCliente: _textControllerName.text,
                          telefone: _textControllerPhone.text,
                          lat: 0.0,
                          lon: 0.0,
                          finalizado: false,
                          hora: DateTime.now().microsecond.toString(),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Salvando...'),
                        ),
                      );
                    }
                  },
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
      ),
    );
  }
}
