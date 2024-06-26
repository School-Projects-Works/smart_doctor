// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? id;
  String? email;
  String? password;
  String? name;
  String? profile;
  String? phone;
  double? height;
  double? weight;
  String? bloodType;
  String? address;
  bool? isOnline;
  String? about;
  String? gender;
  String? medicalHistory;
  String? vaccinationStatus;
  int? createdAt;
  UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.profile,
    this.phone,
    this.height,
    this.weight,
    this.bloodType,
    this.address,
    this.isOnline,
    this.about,
    this.gender,
    this.medicalHistory,
    this.vaccinationStatus,
    this.createdAt,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? profile,
    String? phone,
    double? height,
    double? weight,
    String? bloodType,
    String? address,
    bool? isOnline,
    String? about,
    String? gender,
    String? medicalHistory,
    String? vaccinationStatus,
    int? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      profile: profile ?? this.profile,
      phone: phone ?? this.phone,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bloodType: bloodType ?? this.bloodType,
      address: address ?? this.address,
      isOnline: isOnline ?? this.isOnline,
      about: about ?? this.about,
      gender: gender ?? this.gender,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      vaccinationStatus: vaccinationStatus ?? this.vaccinationStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'profile': profile,
      'phone': phone,
      'height': height,
      'weight': weight,
      'bloodType': bloodType,
      'address': address,
      'isOnline': isOnline,
      'about': about,
      'gender': gender,
      'medicalHistory': medicalHistory,
      'vaccinationStatus': vaccinationStatus,
      'createdAt': createdAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      profile: map['profile'] != null ? map['profile'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      height: map['height'] != null ? map['height'] as double : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      bloodType: map['bloodType'] != null ? map['bloodType'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      isOnline: map['isOnline'] != null ? map['isOnline'] as bool : null,
      about: map['about'] != null ? map['about'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      medicalHistory: map['medicalHistory'] != null
          ? map['medicalHistory'] as String
          : null,
      vaccinationStatus: map['vaccinationStatus'] != null
          ? map['vaccinationStatus'] as String
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, password: $password, name: $name, profile: $profile, phone: $phone, height: $height, weight: $weight, bloodType: $bloodType, address: $address, isOnline: $isOnline, about: $about, gender: $gender, medicalHistory: $medicalHistory, vaccinationStatus: $vaccinationStatus, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.password == password &&
        other.name == name &&
        other.profile == profile &&
        other.phone == phone &&
        other.height == height &&
        other.weight == weight &&
        other.bloodType == bloodType &&
        other.address == address &&
        other.isOnline == isOnline &&
        other.about == about &&
        other.gender == gender &&
        other.medicalHistory == medicalHistory &&
        other.vaccinationStatus == vaccinationStatus &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        profile.hashCode ^
        phone.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        bloodType.hashCode ^
        address.hashCode ^
        isOnline.hashCode ^
        about.hashCode ^
        gender.hashCode ^
        medicalHistory.hashCode ^
        vaccinationStatus.hashCode ^
        createdAt.hashCode;
  }
}
