class Account {
  final String name;
  final String username;
  final String? photo;

  Account({
    required this.name,
    required this.username,
    this.photo,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json['name'],
      username: json['username'],
      photo: json['photo'] as String?,
    );
  }
}
