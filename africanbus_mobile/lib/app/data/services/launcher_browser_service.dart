import 'package:url_launcher/url_launcher.dart';

class LauncherBrowserService {

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

}
