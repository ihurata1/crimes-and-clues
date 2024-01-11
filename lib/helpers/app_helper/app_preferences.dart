class AppPreferences {
  // Singleton tasarım deseni uygulandı
  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  // SharedPreferences instance'ını oluştur
}
