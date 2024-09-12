class UserModel {
  String id;
  String userName;
  String email;
  String phone;

  UserModel(
      {this.id = '',
        required this.userName,
        required this.email,
        required this.phone,
       });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    userName: json['userName'],
    id: json['id'],
    email: json['email'],
    phone: json['phone'],

  );
  Map<String,dynamic> toJson(){
    return{
      'userName':userName,
      'id':id,
      'email':email,
      'phone':phone,
    };
  }
}
