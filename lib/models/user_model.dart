class FacebookUser {
  final String name;
  final String email;

  FacebookUser({required this.name, required this.email});

  factory FacebookUser.fromJson(Map<String, dynamic> json) {
    return FacebookUser(name: json['name'] ?? '', email: json['email'] ?? '');
  }
}
