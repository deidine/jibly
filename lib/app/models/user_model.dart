import 'package:jibly/app/data/constants/constants.dart';

class UserModel {
  String id;
  String name;
  String profilePic;
  String email;
  String phoneNumber;
  String address;
  UserModel({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });
}

UserModel currentUser = UserModel(
    id: '123456789',
    name: 'Waseem Ashmar',
    email: 'semosaemon2004@gmail.com',
    phoneNumber: '0930444946 ',
    profilePic: AppAssets.kProfilePic,
    address: 'Syria, Damascus');

UserModel courierUser = UserModel(
    id: '309356789',
    name: 'Mohammad',
    email: 'Mohammad@gmail.com',
    phoneNumber: '0911122255 ',
    profilePic: AppAssets.kProfilePic2,
    address: 'Syria, Aleppo');
