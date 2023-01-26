import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/common/widgets/button_app_widget.dart';
import 'package:appaguaentregados/app/common/widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/features/home/domain/entity/home_entity.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_cubit.dart';
import 'package:appaguaentregados/app/features/home/presenter/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ButtonPedidoWidget extends StatefulWidget {
  const ButtonPedidoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonPedidoWidget> createState() => _ButtonPedidoWidgetState();
}

class _ButtonPedidoWidgetState extends State<ButtonPedidoWidget> {
  final cubit = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();

    cubit.quantidadeEstoque();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
            child: Text(state.erro.errorMessage),
          );
        }

        if (state is HomeSucess) {
          return StreamBuilder<List<HomeEntity>>(
            stream: state.quantidade,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final quantidadeEstoque = snapshot.data?.first.quantidade;

                return ButtonAppWidget(
                  onPressed: quantidadeEstoque! <= 0
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
                );
              }

              return Container();
            },
          );
        }

        return StreamBuilder<List<HomeEntity>>(
          stream: cubit.quantidadeEstoque(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final quantidadeEstoque = snapshot.data?.first.quantidade;

              return ButtonAppWidget(
                onPressed: quantidadeEstoque! <= 0
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
              );
            }

            return Container();
          },
        );
      },
    );
  }
}
