import 'package:fit_lit/common/pages/pdf_view_page.dart';
import 'package:fit_lit/common/pages/splash_page.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/feature/auth/pages/login_page.dart';
import 'package:fit_lit/feature/auth/pages/register_page.dart';
import 'package:fit_lit/feature/games/pages/detail_game_page.dart';
import 'package:fit_lit/feature/games/pages/evaluation_page.dart';
import 'package:fit_lit/feature/games/pages/game_page.dart';
import 'package:fit_lit/feature/games/pages/playing_game_page.dart';
import 'package:fit_lit/feature/home/pages/edit_profile_page.dart';
import 'package:fit_lit/feature/home/pages/home_page.dart';
import 'package:fit_lit/feature/home/pages/profile_page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Paths.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Paths.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Paths.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Paths.profile,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Paths.editProfile,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: Paths.game,
      page: () => GamePage(),
    ),
    GetPage(
      name: Paths.detailGame,
      page: () => DetailGamePage(),
    ),
    GetPage(
      name: Paths.pdfView,
      page: () => PdfViewPage(),
    ),
    GetPage(
      name: Paths.playingGame,
      page: () => PlayingGamePage(),
    ),
    GetPage(
      name: Paths.evaluation,
      page: () => EvaluationPage(),
    ),
  ];
}
