class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final String? kioskId; // <-- link user to a kiosk
  final String role;     // "owner", "employee"

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    this.kioskId,
    this.role = "owner",
  });

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'email': email,
    'displayName': displayName,
    'photoUrl': photoUrl,
    'kioskId': kioskId,
    'role': role,
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map['uid'] ?? '',
    email: map['email'] ?? '',
    displayName: map['displayName'] ?? '',
    photoUrl: map['photoUrl'] ?? '',
    kioskId: map['kioskId'],
    role: map['role'] ?? "employee",
  );


UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
    String? kioskId,
    String? role,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      kioskId: kioskId ?? this.kioskId,
      role: role?? this.role,
    );
  }
}
