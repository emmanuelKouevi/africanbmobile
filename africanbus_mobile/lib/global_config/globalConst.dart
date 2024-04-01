/// Date: 06-05-2023
/// Author : Emmanuel Herve Kouevi
/// Description: Cette classe contient la liste des constantes

class GlobalConst{
  static final String remoteApiDev ='https://192.168.1.16:8000/';
  static final String remoteApiProd = 'https://africanbrg-1c70f693e9c8.herokuapp.com';

  static final Map<String , String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'server_id': 'backend@africanb',
    'client_id' : 'frontend@africanb',
    'is_admin' : 'isAdmin'
  };
}