/// msg : "OTP match"
/// data : {"id":43,"name":"Karan","image":"noimage.jpg","email":"karanstomar@icloud.com","otp":"1234","added_by":null,"email_verified_at":null,"code":"+91","phone":"8770496665","status":"1","role":"3","verify":1,"device_token":null,"notification":"1","mail":"1","created_at":"2022-12-19T10:14:29.000000Z","updated_at":"2022-12-19T10:14:29.000000Z","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzk1OWE2N2Q5MGEyZDBkYzlkODZkNWFmZTgzNTUzMjE4M2ZhYjczMGM1NGQ2ZjU1NDg1NTlmOGFiNjYzOGI0YzRiM2YwMjEwNzBjN2NkYjEiLCJpYXQiOiIxNjcxNDU4NzM5LjY4MzU1NCIsIm5iZiI6IjE2NzE0NTg3MzkuNjgzNTU4IiwiZXhwIjoiMTcwMjk5NDczOS42ODE1NzIiLCJzdWIiOiI0MyIsInNjb3BlcyI6W119.B5p8xfpahe4okLqK2C2-FFeE3QwIS3NeexX2DFzmY6FB3asvhsjaBXrX9QrfYvazttGyP2FYOJtbcpCAQjE9_KMgEjgoq1M2IeNTK7m2Xy_Cc8WBNBxChWo5A7Xw45vBwHwKFhCoEBfWgMVxsa_PctsPOgO6JNP2V0MSZhKeHdt0lvUkZp9X1SwVfpP4dkQxiY35kvEZ4sTRuImoeno2Al-cptf8b65NkdpS8xvXx9UBSusP5dQLtOuHTNlTpJYhWFZ2u5QG3dF_8fO5OB6OCWJiYLDgHk-cYRD8yzqhQgLcHj_h9ZjJLGP7dfPkIQ9OOjxfwcAIOOeZADtDH_e0PETw9mBh_85uY_ABock4f90nT-xCrn1nJtm9EZNMj11497K4JmQawf_x9As7xpcO215D4n7vrlnJ9gRIMTjqM_PH5vxyvyvMkrAMIGMi6bkB0qwUaPEIfFB7l8Ttn3GUXClkdteD8vSiNhSDwnwrfsBraGqmcWTTH5OyashAstTvPlqsQz44NNnFii14O2vIh4efAO0lh-8TANUrp3MsBE2NIN_k2wPNWKSXfq6GkoTSDEn-LeBmMqgC0RHOB4pwf38QFHvByTWYsCNRzGQhfPrir6UERWgdfbFAw0ch9iB--GgvtOpq3bbAhtBz769hCuC_s78NLUHWpoywcnDuhGc","imagePath":"https://rasthetique.com/public/storage/images/users/"}
/// success : true

class OtpmatchResponse {
  OtpmatchResponse({
    String? msg,
    Data? data,
    bool? success,}){
    _msg = msg;
    _data = data;
    _success = success;
  }

  OtpmatchResponse.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
  }
  String? _msg;
  Data? _data;
  bool? _success;
  OtpmatchResponse copyWith({  String? msg,
    Data? data,
    bool? success,
  }) => OtpmatchResponse(  msg: msg ?? _msg,
    data: data ?? _data,
    success: success ?? _success,
  );
  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  bool? get success => _success;
  set success(bool? success) => _success = success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    return map;
  }

}

/// id : 43
/// name : "Karan"
/// image : "noimage.jpg"
/// email : "karanstomar@icloud.com"
/// otp : "1234"
/// added_by : null
/// email_verified_at : null
/// code : "+91"
/// phone : "8770496665"
/// status : "1"
/// role : "3"
/// verify : 1
/// device_token : null
/// notification : "1"
/// mail : "1"
/// created_at : "2022-12-19T10:14:29.000000Z"
/// updated_at : "2022-12-19T10:14:29.000000Z"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzk1OWE2N2Q5MGEyZDBkYzlkODZkNWFmZTgzNTUzMjE4M2ZhYjczMGM1NGQ2ZjU1NDg1NTlmOGFiNjYzOGI0YzRiM2YwMjEwNzBjN2NkYjEiLCJpYXQiOiIxNjcxNDU4NzM5LjY4MzU1NCIsIm5iZiI6IjE2NzE0NTg3MzkuNjgzNTU4IiwiZXhwIjoiMTcwMjk5NDczOS42ODE1NzIiLCJzdWIiOiI0MyIsInNjb3BlcyI6W119.B5p8xfpahe4okLqK2C2-FFeE3QwIS3NeexX2DFzmY6FB3asvhsjaBXrX9QrfYvazttGyP2FYOJtbcpCAQjE9_KMgEjgoq1M2IeNTK7m2Xy_Cc8WBNBxChWo5A7Xw45vBwHwKFhCoEBfWgMVxsa_PctsPOgO6JNP2V0MSZhKeHdt0lvUkZp9X1SwVfpP4dkQxiY35kvEZ4sTRuImoeno2Al-cptf8b65NkdpS8xvXx9UBSusP5dQLtOuHTNlTpJYhWFZ2u5QG3dF_8fO5OB6OCWJiYLDgHk-cYRD8yzqhQgLcHj_h9ZjJLGP7dfPkIQ9OOjxfwcAIOOeZADtDH_e0PETw9mBh_85uY_ABock4f90nT-xCrn1nJtm9EZNMj11497K4JmQawf_x9As7xpcO215D4n7vrlnJ9gRIMTjqM_PH5vxyvyvMkrAMIGMi6bkB0qwUaPEIfFB7l8Ttn3GUXClkdteD8vSiNhSDwnwrfsBraGqmcWTTH5OyashAstTvPlqsQz44NNnFii14O2vIh4efAO0lh-8TANUrp3MsBE2NIN_k2wPNWKSXfq6GkoTSDEn-LeBmMqgC0RHOB4pwf38QFHvByTWYsCNRzGQhfPrir6UERWgdfbFAw0ch9iB--GgvtOpq3bbAhtBz769hCuC_s78NLUHWpoywcnDuhGc"
/// imagePath : "https://rasthetique.com/public/storage/images/users/"

class Data {
  Data({
    num? id,
    String? name,
    String? image,
    String? email,
    String? otp,
    dynamic addedBy,
    dynamic emailVerifiedAt,
    String? code,
    String? phone,
    String? status,
    String? role,
    num? verify,
    dynamic deviceToken,
    String? notification,
    String? mail,
    String? createdAt,
    String? updatedAt,
    String? token,
    String? imagePath,}){
    _id = id;
    _name = name;
    _image = image;
    _email = email;
    _otp = otp;
    _addedBy = addedBy;
    _emailVerifiedAt = emailVerifiedAt;
    _code = code;
    _phone = phone;
    _status = status;
    _role = role;
    _verify = verify;
    _deviceToken = deviceToken;
    _notification = notification;
    _mail = mail;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _token = token;
    _imagePath = imagePath;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _email = json['email'];
    _otp = json['otp'];
    _addedBy = json['added_by'];
    _emailVerifiedAt = json['email_verified_at'];
    _code = json['code'];
    _phone = json['phone'];
    _status = json['status'];
    _role = json['role'];
    _verify = json['verify'];
    _deviceToken = json['device_token'];
    _notification = json['notification'];
    _mail = json['mail'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _token = json['token'];
    _imagePath = json['imagePath'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _email;
  String? _otp;
  dynamic _addedBy;
  dynamic _emailVerifiedAt;
  String? _code;
  String? _phone;
  String? _status;
  String? _role;
  num? _verify;
  dynamic _deviceToken;
  String? _notification;
  String? _mail;
  String? _createdAt;
  String? _updatedAt;
  String? _token;
  String? _imagePath;
  Data copyWith({  num? id,
    String? name,
    String? image,
    String? email,
    String? otp,
    dynamic addedBy,
    dynamic emailVerifiedAt,
    String? code,
    String? phone,
    String? status,
    String? role,
    num? verify,
    dynamic deviceToken,
    String? notification,
    String? mail,
    String? createdAt,
    String? updatedAt,
    String? token,
    String? imagePath,
  }) => Data(  id: id ?? _id,
    name: name ?? _name,
    image: image ?? _image,
    email: email ?? _email,
    otp: otp ?? _otp,
    addedBy: addedBy ?? _addedBy,
    emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
    code: code ?? _code,
    phone: phone ?? _phone,
    status: status ?? _status,
    role: role ?? _role,
    verify: verify ?? _verify,
    deviceToken: deviceToken ?? _deviceToken,
    notification: notification ?? _notification,
    mail: mail ?? _mail,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    token: token ?? _token,
    imagePath: imagePath ?? _imagePath,
  );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get email => _email;
  String? get otp => _otp;
  dynamic get addedBy => _addedBy;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get code => _code;
  String? get phone => _phone;
  String? get status => _status;
  String? get role => _role;
  num? get verify => _verify;
  dynamic get deviceToken => _deviceToken;
  String? get notification => _notification;
  String? get mail => _mail;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get token => _token;
  String? get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['email'] = _email;
    map['otp'] = _otp;
    map['added_by'] = _addedBy;
    map['email_verified_at'] = _emailVerifiedAt;
    map['code'] = _code;
    map['phone'] = _phone;
    map['status'] = _status;
    map['role'] = _role;
    map['verify'] = _verify;
    map['device_token'] = _deviceToken;
    map['notification'] = _notification;
    map['mail'] = _mail;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['token'] = _token;
    map['imagePath'] = _imagePath;
    return map;
  }

}