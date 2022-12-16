import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/domain/utils/routes_app.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/presenter/view/home/controller/home_cubit.dart';
import 'package:appaguaentregados/app/presenter/view/home/controller/home_state.dart';
import 'package:appaguaentregados/app/presenter/view/home/widgets/loading_estoque.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.blueLight,
        body: Column(
          children: [
            Expanded(
              flex: 3,
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
                          'Quantidade de garrafões de água disponivel no estoque',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      BlocBuilder<HomeCubit, HomeState>(
                        bloc: cubit,
                        builder: (context, state) {
                          if (state is HomeLoading) {
                            return Center(
                              child: CircularProgressWidget(
                                color: ColorsApp.white,
                              ),
                            );
                          }

                          if (state is HomeErro) {
                            return Center(
                              child: Text(state.erro),
                            );
                          }

                          if (state is HomeSucess) {
                            return StreamBuilder<QuerySnapshot<Object?>>(
                              stream: cubit.estoque,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final quantidade = snapshot.data?.docs.first;

                                  return Column(
                                    children: [
                                      Text(
                                        quantidade!['quantidade'].toString(),
                                        style: const TextStyle(
                                          color: ColorsApp.white,
                                          fontSize: 90,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Image.asset(
                                        quantidade['quantidade'] <= 0
                                            ? 'assets/images/sem-agua.png'
                                            : 'assets/images/garrafa-de-agua1.png',
                                        width: 200,
                                      ),
                                    ],
                                  );
                                }

                                return const LoadingQtdAgua();
                              },
                            );
                          }

                          return Container();
                        },
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

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.blueDarck,
                          padding: const EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 54,
                          ),
                        ),
                        onPressed: quantidade!['quantidade'] <= 0
                            ? null
                            : () {
                                Navigator.pushNamed(
                                    context, RoutesApp.infoUser);
                              },
                        child: const Text(
                          'Compra água',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
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
    );
  }
}
