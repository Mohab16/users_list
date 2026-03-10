class LoginResponseModel {
  Data? data;

  LoginResponseModel({this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? sent;
  int? expiresInMinutes;
  String? message;

  Data({this.sent, this.expiresInMinutes, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    sent = json['sent'];
    expiresInMinutes = json['expires_in_minutes'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sent'] = this.sent;
    data['expires_in_minutes'] = this.expiresInMinutes;
    data['message'] = this.message;
    return data;
  }
}
