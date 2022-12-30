// ignore_for_file: unused_field

import 'package:appaguaentregados/app/common/utils/colors_app.dart';
import 'package:appaguaentregados/app/common/utils/routes_app.dart';
import 'package:appaguaentregados/app/common/widgets/ciruclar_progress_widget.dart';
import 'package:appaguaentregados/app/common/widgets/floating_button_app_widget.dart';
import 'package:appaguaentregados/app/features/map/presenter/controllers/map_cubit.dart';
import 'package:appaguaentregados/app/features/map/presenter/controllers/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final cubit = GetIt.I.get<MapCubit>();
  late GoogleMapController _controller;

  _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();

    cubit.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Localização'),
          backgroundColor: ColorsApp.bluePrimary,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<MapCubit, MapState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is MapLoading) {
              return Center(
                child: CircularProgressWidget(
                  color: ColorsApp.bluePrimary,
                ),
              );
            }

            if (state is MapError) {
              return Center(
                child: Text(state.erro.toString()),
              );
            }

            if (state is MapSucess) {
              return Scaffold(
                body: GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.hybrid,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      state.lat,
                      state.lon,
                    ),
                    zoom: 20,
                  ),
                  onMapCreated: _onMapCreated,
                ),
                floatingActionButton: FloatingButtonAppWidget(
                  icon: const Icon(Icons.check),
                  label: 'Confirmar',
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesApp.infoUser);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Localização registrada 🙂'),
                      ),
                    );
                  },
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
