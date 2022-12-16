import 'package:appaguaentregados/app/domain/utils/colors_app.dart';
import 'package:appaguaentregados/app/presenter/global_widgets/ciruclar_progress_widget.dart';
import 'package:flutter/material.dart';

class LoadingQtdAgua extends StatelessWidget {
  const LoadingQtdAgua({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            width: 200,
          ),
        ],
      ),
    );
  }
}
