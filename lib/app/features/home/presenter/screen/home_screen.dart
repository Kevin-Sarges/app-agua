import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/features/home/presenter/widgets/button_pedido_widget.dart';
import 'package:appaguaentregados/app/features/home/presenter/widgets/qtd_estoque_widget.dart';
import 'package:appaguaentregados/app/features/home/presenter/widgets/text_header_home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blueLight,
      body: SafeArea(
        child: Column(
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
                      const QtdEstoqueWidget(),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: ButtonPedidoWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
