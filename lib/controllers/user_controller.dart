import 'package:e_commerce_app/data/repository/user_repo.dart';
import 'package:e_commerce_app/models/response_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService{
 final UserRepo userRepo;
UserController({required this.userRepo});
  
  

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async{
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfully");

    }else{
      responseModel = ResponseModel(false, response.statusText!);
      print(response.statusText);
    }
    update();
    return responseModel;

  }

}