import 'package:flutter/material.dart';
import 'package:flutter_map_booking/Blocs/place_bloc.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<PlaceBloc>(context);

    return HomeView(
      placeBloc: bloc,
    );
  }
}
