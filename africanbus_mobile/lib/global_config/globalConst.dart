import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../app/home/repository/reservation_reporitory.dart';
import '../app/login/viewmodel/login_view_model.dart';
import '../app/modules/auth/repository/auth_repository.dart';

/// Date: 06-05-2023
/// Author : Emmanuel Herve Kouevi
/// Description: Cette classe contient la liste des constantes

class GlobalConst{

  static final String remoteApiDev ='https://127.0.0.1:8443';
  static final String remoteApiProd = 'https://africanbrg-1c70f693e9c8.herokuapp.com';

  static final Map<String , String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'server_id': 'backend@africanb',
    'client_id' : 'frontend@africanb',
    'is_admin' : 'isAdmin'
  };

  static final List<SingleChildWidget>providers = [
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ReservationRepository(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepository(),
    ),
  ];
}