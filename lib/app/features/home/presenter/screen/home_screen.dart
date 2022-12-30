import 'package:appaguaentregados/app/common/global_widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/global_widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_cubit.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_state.dart';
import 'package:appaguaentregados/app/features/home/presenter/widgets/text_header_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();

    cubit.quantidadeEstoque();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.blueLight,
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(
                child: CircularProgressWidget(
                  color: ColorsApp.blueDarck,
                ),
              );
            }

            if (state is HomeErro) {
              return Center(
                child: Text(state.erro.toString()),
              );
            }

            if (state is HomeSucess) {
              final qnt = state.quantidade.first.quantidade;

              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: ColorsApp.linearGradientBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    TextHeaderHomeWidget(
                                      text: 'Troca: R\$ 8,00',
                                    ),
                                    TextHeaderHomeWidget(
                                      text: 'Novo: R\$ 16,00',
                                    )
                                  ],
                                ),
                                TextHeaderHomeWidget(
                                  text: 'Contato: 9 8346-3984',
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const SizedBox(
                              width: 200,
                              child: Text(
                                'Quantidade de garrafões de água disponivel no estoque',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '$qnt',
                                  style: const TextStyle(
                                    color: ColorsApp.white,
                                    fontSize: 90,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  qnt <= 0
                                      ? 'assets/images/sem-agua.png'
                                      : 'assets/images/garrafa-de-agua1.png',
                                  width: largura * 0.50,
                                  height: altura * 0.20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ButtonAppWidget(
                        onPressed: qnt <= 0
                            ? null
                            : () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesApp.infoUser,
                                );
                              },
                        text: const Text(
                          'Compra água',
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
