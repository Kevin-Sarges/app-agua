import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/common/widgets/floating_button_app_widget.dart';
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingButtonAppWidget(
      icon: const Icon(Icons.maps_ugc_outlined),
      label: 'Localização',
      onPressed: () {
        Navigator.pushNamed(context, RoutesApp.map);
      },
    );
  }
}
