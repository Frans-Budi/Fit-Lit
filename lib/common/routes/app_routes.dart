abstract class Routes {
  Routes._();
  static const splash = Paths.splash;
  static const login = Paths.login;
  static const register = Paths.register;
  static const home = Paths.home;
  static const profile = Paths.profile;
  static const editProfile = Paths.editProfile;
  static const game = Paths.game;
  static const detailGame = Paths.detailGame;
  static const pdfView = Paths.pdfView;
  static const playingGame = Paths.playingGame;
  static const evaluation = Paths.evaluation;
}

abstract class Paths {
  Paths._();
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const profile = '/profile';
  static const editProfile = '/edit-profile';
  static const game = '/game';
  static const detailGame = '/detail-game';
  static const pdfView = '/pdf-view';
  static const playingGame = '/playing_game';
  static const evaluation = '/evaluation';
}
