import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_cubit.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class QtdEstoqueWidget extends StatefulWidget {
  const QtdEstoqueWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<QtdEstoqueWidget> createState() => _QtdEstoqueWidgetState();
}

class _QtdEstoqueWidgetState extends State<QtdEstoqueWidget> {
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

    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is HomeSucess) {
          return;
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return Expanded(
            child: Center(
              child: CircularProgressWidget(
                color: ColorsApp.white,
              ),
            ),
          );
        }

        if (state is HomeErro) {
          return Center(
            child: Text(state.erro.errorMessage),
          );
        }

        if (state is HomeSucess) {
          return StreamBuilder(
            stream: state.quantidade,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final quantidadeEstoque = snapshot.data?.first.quantidade;

                return Column(
                  children: [
                    Text(
                      '$quantidadeEstoque',
                      style: const TextStyle(
                        color: ColorsApp.white,
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      quantidadeEstoque! <= 0
                          ? 'assets/images/sem-agua.png'
                          : 'assets/images/garrafa-de-agua1.png',
                      width: largura * 0.50,
                      height: altura * 0.20,
                    ),
                  ],
                );
              }

              return Container();
            },
          );
        }

        return StreamBuilder(
          stream: cubit.quantidadeEstoque(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final quantidadeEstoque = snapshot.data?.first.quantidade;

              return Column(
                children: [
                  Text(
                    '$quantidadeEstoque',
                    style: const TextStyle(
                      color: ColorsApp.white,
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    quantidadeEstoque! <= 0
                        ? 'assets/images/sem-agua.png'
                        : 'assets/images/garrafa-de-agua1.png',
                    width: largura * 0.50,
                    height: altura * 0.20,
                  ),
                ],
              );
            }

            return Container();
          },
        );
      },
    );
  }
}
