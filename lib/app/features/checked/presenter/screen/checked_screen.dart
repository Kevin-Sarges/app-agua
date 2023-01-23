import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/common/widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/common/widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/features/checked/presenter/controller/checked_cubit.dart';
import 'package:appaguaentregados/app/features/checked/presenter/controller/checked_state.dart';
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
  void initState() {
    super.initState();

    cubit.getQnt();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsApp.blueLight,
      body: SafeArea(
        child: BlocBuilder<CheckedCubit, CheckedState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is CheckedLoading) {
              return Center(
                child: CircularProgressWidget(
                  color: ColorsApp.blueDarck,
                ),
              );
            }

            if (state is CheckedError) {
              return Center(
                child: Text('${state.message}'),
              );
            }

            if (state is CheckedSucess) {
              return Column(
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
                              width: largura * 0.50,
                              height: altura * 0.20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
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
                              final total =
                                  state.quantidade.first.quantidade - 1;

                              cubit.update(total);

                              Navigator.pushNamed(
                                context,
                                RoutesApp.home,
                              );
                            },
                            text: const Text(
                              'Realizar compra',
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
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
