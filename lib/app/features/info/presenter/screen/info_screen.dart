// ignore_for_file: use_build_context_synchronously

import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/formas_pagamento.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/common/utils/tipo_entrega.dart';
import 'package:appaguaentregados/app/common/widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/features/info/data/model/info_model.dart';
import 'package:appaguaentregados/app/features/info/presenter/controllers/info_cubit.dart';
import 'package:appaguaentregados/app/features/info/presenter/controllers/info_state.dart';
import 'package:appaguaentregados/app/features/info/presenter/widgets/floating_button_widget.dart';
import 'package:appaguaentregados/app/features/info/presenter/widgets/inputsText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
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

  String pagamento = FormaPagamentos.pagamentos.first;
  String entrega = TipoEntrega.entrega.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blueLight,
      appBar: AppBar(
        title: const Text('Nome e Contato'),
        backgroundColor: ColorsApp.bluePrimary,
      ),
      body: SafeArea(
        child: BlocListener<InfoCubit, InfoState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is InfoSucess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Seus dados foram salvos 🙂'),
                ),
              );

              Navigator.pushNamed(context, RoutesApp.checkedScreen);

              return;
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
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
                          keyboardType: TextInputType.text,
                        ),
                        InputText(
                          controller: _textControllerPhone,
                          labelInput: const Text('Número para contato'),
                          hintText: 'Ex: 984279843',
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Pagamento:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                DropdownButton(
                                  value: pagamento,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  items: FormaPagamentos.pagamentos
                                      .map(
                                        (value) => DropdownMenuItem(
                                          value: value,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                value == 'PIX'
                                                    ? 'assets/images/logo-pix.png'
                                                    : 'assets/images/dinheiro.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(value)
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      pagamento = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tipo de pedido:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                DropdownButton(
                                  value: entrega,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  items: TipoEntrega.entrega
                                      .map(
                                        (value) => DropdownMenuItem(
                                          value: value,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                value == 'Troca de Garrafão'
                                                    ? 'assets/images/troca.png'
                                                    : 'assets/images/garrafa-de-agua1.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(value)
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      entrega = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonAppWidget(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final local = await Geolocator.getCurrentPosition();

                        cubit.salvarDadosUsuario(
                          InfoModel(
                            nomeCliente: _textControllerName.text,
                            telefone: _textControllerPhone.text,
                            lat: local.latitude,
                            lon: local.longitude,
                            finalizado: false,
                            tipoEntrega: entrega,
                            tipoPagamento: pagamento,
                            hora: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
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
                        horizontal: 20,
                        vertical: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingButtonWidget(),
    );
  }
}
