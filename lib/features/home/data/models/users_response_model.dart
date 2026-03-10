class UsersResponseModel {
  List<UserRecord>? data;
  Meta? meta;

  UsersResponseModel({this.data, this.meta});

  UsersResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserRecord>[];
      json['data'].forEach((v) {
        data!.add(UserRecord.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class UserRecord {
  String? id;
  String? collectionId;
  int? projectId;
  String? appUserId;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  UserData? data;

  UserRecord({
    this.id,
    this.collectionId,
    this.projectId,
    this.appUserId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.data,
  });

  UserRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collection_id'];
    projectId = json['project_id'];
    appUserId = json['app_user_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['collection_id'] = collectionId;
    data['project_id'] = projectId;
    data['app_user_id'] = appUserId;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? name;
  String? role;
  String? email;

  UserData({this.name, this.role, this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['role'] = role;
    data['email'] = email;
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? pages;

  Meta({this.page, this.limit, this.total, this.pages});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['pages'] = pages;
    return data;
  }
}
