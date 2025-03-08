// ignore_for_file: constant_identifier_names

class AppConstants {
  /// HINT
  static const String HINT_TEXT_FIELD_NAME = 'Nama Lengkap';
  static const String HINT_TEXT_FIELD_USERNAME = 'Username';
  static const String HINT_TEXT_FIELD_PASSWORD = 'Kata Sandi';
  static const String HINT_TEXT_FIELD_CONFIRM_PASSWORD =
      'Konfirmasi Kata Sandi';
  static const String HINT_TEXT_FIELD_EVALUATION = 'Masukkan jawaban disini';

  /// LABEL
  static const String LBL_REDIRECT_TO_LOGIN = 'Sudah pernah bermain? ';
  static const String LBL_REDIRECT_TO_REGISTER = 'Belum pernah bermain? ';
  static const String LBL_GREEDING = 'Hai, ';
  static const String LBL_GREEDING_SUB = 'Sudah siap bergerak hari ini?';
  static const String LBL_CONFIRM_SAFETY = 'Pastikan Keamaan Sebelum Bermain';
  static const String LBL_CONFIRM_FINISH =
      'Apakah permainan sudah selesai dilakukan?';
  static const String LBL_EVALUATION_SAVED = 'Evaluasi Tersimpan';
  static const String LBL_CONFIRM_LOGOUT = 'Apakah kamu yakin ingin keluar?';

  /// TITLE
  static const String TTL_FIT_LIT = 'Fit Lit';
  static const String TTL_EDIT_PROFILE = 'Edit Profil';
  static const String TTL_ABOUT_US = 'Tentang Kami';
  static const String TTL_ACTIVITY_INFORMATION = 'Informasi Kegiatan';
  static const String TTL_EVALUATION = 'Evaluasi Kegiatan';

  /// PDF
  static const String PDF_ABOUT_US = 'Permainan PL Anak 8-12 tahun.pdf';

  /// KEY
  static const String KEY_ASSETS = 'assets';
  static const String KEY_IMAGES = 'images';
  static const String KEY_PDF = 'pdf';
  static const String KEY_HOME = 'home';
  static const String KEY_USERS = 'users';
  static const String KEY_USERNAME = 'username';
  static const String KEY_EVALUATIONS = 'evaluations';

  /// ACTION
  static const String ACT_REGISTER = 'Daftar';
  static const String ACT_LOGIN = 'Masuk';
  static const String ACT_CHANGE = 'Ubah';
  static const String ACT_EDIT_PROFILE = 'Edit Profil';
  static const String ACT_FAQ = 'FAQ';
  static const String ACT_ABOUT_US = 'Tentang Kami';
  static const String ACT_LOGOUT = 'Keluar';
  static const String ACT_PLAY = 'Main';
  static const String ACT_HAVE_NOT_SAFE = 'Belum Aman';
  static const String ACT_YES_ALREADY_SAFE = 'Ya, Sudah Aman';
  static const String ACT_PREVIOUS = 'Sebelumnya';
  static const String ACT_NEXT = 'Selanjutnya';
  static const String ACT_START_PLAY = 'Mulai Bermain';
  static const String ACT_BACK_TO_INSTRUCTION = 'Kembali ke Instruksi';
  static const String ACT_YES_ALREADY_FINISH = 'Ya, Sudah Selesai';
  static const String ACT_SAVE_EVALUATION = 'Simpan Evaluasi';
  static const String ACT_NO_LOGOUT = 'Tidak';
  static const String ACT_YES_LOGOUT = 'Ya, saya yakin';
  static const String ACT_SELECT_ALBUM = 'Pilih dari album foto';
  static const String ACT_TAKE_PICTURE = 'Ambil foto';
  static const String ACT_REPEAT = 'Ulangi';
  static const String ACT_EDIT_EVALUATION = 'Edit Evaluasi';

  /// ERROR
  static const String ERR_NAME_MUST_FILLED = 'Nama harus diisi';
  static const String ERR_NAME_MUST_LETTERS = 'Nama harus terdiri dari huruf';
  static const String ERR_NAME_LENGTH = 'Nama harus terdiri dari 3-50 karakter';
  static const String ERR_USERNAME_MUST_FILLED = 'Username harus diisi';
  static const String ERR_USERNAME_LENGTH =
      'Username harus terdiri dari 3-30 karakter';
  static const String ERR_USERNAME_FORMAT =
      'Username hanya terdiri dari huruf & angka';
  static const String ERR_PASSWORD_MUST_FILLED = 'Password harus diisi';
  static const String ERR_PASSWORD_LENGTH =
      'Password minimal terdiri dari 8 karakter';
  static const String ERR_PASSWORD_FORMAT =
      'Password min. 1 angka & 1 karakter unik';
  static const String ERR_PASSWORD_NO_SPACE =
      'Password tidak boleh mengandung spasi';
  static const String ERR_CONFIRM_PASSWORD = 'Konfirmasi Password harus sama';
  static const String ERR_USERNAME_ALREADY_REGISTERED =
      'Username sudah terdaftar!';
  static const String ERR_LOGIN_MESSAGE =
      'Username atau Password yang Anda masukkan salah!';

  /// LIST
  static const List<String> CONFIRM_PLAY_DESC = [
    "Pastikan bahwa tempat bermain berada pada jarak yang aman dari dinding dan bebas dari bahaya (misalnya, bangku, peralatan, jaring bola basket, lubang, kerikil lepas, rumput basah); menghilangkan atau menandai bahaya apa pun.",
    "Berikan jarak aman antara permainan yang terjadi di ruang yang sama.",
    "Ingatkan siswa untuk menjaga kepala mereka tetap tegak dan waspada terhadap orang lain saat bergerak melalui di ruangan."
  ];

  static const Duration SPLASH_DURATION = Duration(seconds: 2);
}
