import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/widgets/ciruclar_progress_widget.dart';
import 'package:flutter/material.dart';

class LoadingQtdAgua extends StatelessWidget {
  const LoadingQtdAgua({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        spacing: 40,
        children: [
          const SizedBox(height: 1),
          CircularProgressWidget(
            color: ColorsApp.white,
          ),
          Image.asset(
            'assets/images/garrafa-de-agua1.png',
            width: largura * 0.50,
            height: altura * 0.20,
          ),
        ],
      ),
    );
  }
}
