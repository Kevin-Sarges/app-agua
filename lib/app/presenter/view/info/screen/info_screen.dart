// ignore_for_file: use_build_context_synchronously

import 'package:appaguaentregados/app/data/model/model_pedidos.dart';
import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/domain/utils/formas_pagamento.dart';
import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:appaguaentregados/app/domain/utils/tipo_entrega.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/presenter/view/info/controllers/info_cubit.dart';
import 'package:appaguaentregados/app/presenter/view/info/controllers/info_state.dart';
import 'package:appaguaentregados/app/presenter/view/info/widgets/floating_button_widget.dart';
import 'package:appaguaentregados/app/presenter/view/info/widgets/inputsText.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.blueLight,
        appBar: AppBar(
          title: const Text('Nome e Contato'),
          backgroundColor: ColorsApp.bluePrimary,
        ),
        body: BlocListener<InfoCubit, InfoState>(
          listener: (context, state) {
            if (state is InfoSucess) {
              Navigator.pushNamed(context, RoutesApp.checkedScreen);
              return;
            }
          },
          bloc: cubit,
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
                                          child: Text(value),
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
                                          child: Text(value),
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
                          ModelPedidos(
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

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Salvo 🙂'),
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
        floatingActionButton: const FloatingButtonWidget(),
      ),
    );
  }
}
