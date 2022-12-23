import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/presenter/view/checked/controller/checked_cubit.dart';
import 'package:appaguaentregados/app/presenter/view/checked/controller/checked_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CheckedScreen extends StatefulWidget {
  const CheckedScreen({Key? key}) : super(key: key);

  @override
  State<CheckedScreen> createState() => _CheckedScreenState();
}

class _CheckedScreenState extends State<CheckedScreen> {
  final cubit = GetIt.I.get<CheckedCubit>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.blueLight,
        body: BlocListener<CheckedCubit, CheckedState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is CheckedSucess) {
              Navigator.pushNamed(context, RoutesApp.home);
              return;
            }
          },
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 560,
                  decoration: const BoxDecoration(
                    gradient: ColorsApp.linearGradientBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 200,
                          child: Text(
                            'Produto está acaminho',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/monitorando.png',
                          width: 250,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: StreamBuilder<QuerySnapshot<Object?>>(
                    stream: cubit.estoque,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final quantidade = snapshot.data?.docs.first;

                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Seu pedido já está indo em direção a você, finalize a compra para comfirma o pedido, caso demore muito para chegar entre em contato por esse número: ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const Text(
                              '9 8346-3984',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorsApp.bluePrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonAppWidget(
                              onPressed: () {
                                final total = quantidade!['quantidade'] - 1;

                                cubit.novoValorEstoque(total);
                              },
                              text: const Text(
                                'Finalizar compra',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsApp.blueDarck,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 54,
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return CircularProgressWidget(
                        color: ColorsApp.bluePrimary,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
