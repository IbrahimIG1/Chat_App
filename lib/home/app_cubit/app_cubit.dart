import 'package:chaty/constance/uId.dart';
import 'package:chaty/home/app_cubit/app_cubit_state.dart';
import 'package:chaty/model/users_model/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(InitAppCubitState());

  static AppCubit get(context) => BlocProvider.of(context);
  //  Get User Data Form Firebase
  UserModel? userModel;

  void getUserData() {
    emit(GetUserDataLoadingAppCubitState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(userModel!.name);
      // emit(GetUserDataSuccessAppCubitState());
    }).catchError((error) {
      print('Error In Get Data User $error');
      emit(GetUserDataErrorAppCubitState());
    });
  }

  // Get All Users From Firebase
  List<UserModel> usersData = [];
  void getUsersData() {
    if (usersData.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (uId == element.id) {
            usersData.remove(UserModel.fromJson(element.data()));
          }else
          {
 usersData.add(
            UserModel.fromJson(element.data()),
          );
          }
         
          print(usersData.length);
          emit(GetAllUsersDataSuccessAppCubitState());
        });
      }).catchError((error) {
        print('Error In Get Users data $error');
        emit(GetAllUsersDataErrorAppCubitState());
      });
    }
  }
}
