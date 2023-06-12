import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_doctor/models/user_model.dart';

import '../models/doctor_model.dart';

class FireStoreServices{
  static final _fireStore = FirebaseFirestore.instance;

  static Future<DoctorModel?>getDoctor(String id)async{
    final doctor = await _fireStore.collection('doctors').doc(id).get();
    return DoctorModel.fromMap(doctor.data()!);
  }

  static Future<UserModel?> getUser(String uid) async{
    final user = await _fireStore.collection('users').doc(uid).get();
    return UserModel.fromMap(user.data()!);
  }
}