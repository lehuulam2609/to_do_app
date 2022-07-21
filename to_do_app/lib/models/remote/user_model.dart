class UserMainResponse {
  List<UserSubResponse> data;

  UserMainResponse({
    this.data,
  });

  factory UserMainResponse.fromJson(Map<String, dynamic> json) {
    return UserMainResponse(
      data: json["data"] != null
          ? (json["data"] as List)
              .map((e) => UserSubResponse.fromJson(e))
              .toList()
          : [],
    );
  }
}

class UserSubResponse {
  UserModel fieldData;
  String recordId;
  String modId;

  UserSubResponse({
    this.fieldData,
    this.recordId,
    this.modId,
  });

  factory UserSubResponse.fromJson(Map<String, dynamic> json) {
    return UserSubResponse(
      fieldData: json["fieldData"] != null
          ? UserModel.fromJson(json["fieldData"])
          : null,
      recordId: json['recordId'] ?? '',
      modId: json['modId'] ?? '',
    );
  }

   Map<String, dynamic> toJson() {
    return {
      "fieldData": fieldData.toJson(),
      "modId": modId,
      "recordId": recordId,
    };
  }
}

class UserModel {
  String firstName;
  String lastName;
  String loginname;
  String email;
  String pushNotificationID;
  String zcAvatarEncode;
  String hasAccessToUserManagement;
  String usersStaffFarmerGroupName;
  String usersStaffFarmerGroupPrimaryKey;
  String zgPrivilege;
  String userStaffGroupName;
  String userStaffGroupPrimaryKey;
  String region;
  int isPasswordChangeNeeded;

  UserModel({
    this.firstName,
    this.lastName,
    this.loginname,
    this.email,
    this.pushNotificationID,
    this.zcAvatarEncode,
    this.hasAccessToUserManagement,
    this.usersStaffFarmerGroupName,
    this.usersStaffFarmerGroupPrimaryKey,
    this.zgPrivilege,
    this.userStaffGroupName,
    this.userStaffGroupPrimaryKey,
    this.region,
    this.isPasswordChangeNeeded,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json["FirstName"] ?? '',
      lastName: json["LastName"] ?? '',
      loginname: json['Loginname'] ?? '',
      email: json["Email"] ?? '',
      pushNotificationID: json['PushNotificationID'] ?? '',
      zcAvatarEncode: json['zcAvatarEncode'] ?? '',
      hasAccessToUserManagement: (json['HasAccessToUserManagement'] ?? '').toString(),
      usersStaffFarmerGroupName: json['Users_Staff_FarmerGroup::Name'] ?? '',
      usersStaffFarmerGroupPrimaryKey: json['Users_Staff_FarmerGroup::PrimaryKey'] ?? '',
      zgPrivilege: json['zgPrivilege'] ?? '',
      userStaffGroupName: json['User_StaffGroup::Name'] ?? '',
      userStaffGroupPrimaryKey: json['User_StaffGroup::PrimaryKey'] ?? '',
      region: json['Region'] ?? '',
      isPasswordChangeNeeded: json['IsPasswordChangeNeeded'] == '' ? 0 : (int.tryParse((json['IsPasswordChangeNeeded'] ?? 0).toString()) ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Loginname": loginname,
      "Email": email,
      "PushNotificationID": pushNotificationID,
      "zcAvatarEncode": zcAvatarEncode,
      "HasAccessToUserManagement": hasAccessToUserManagement,
      "Users_Staff_FarmerGroup::Name": usersStaffFarmerGroupName,
      "Users_Staff_FarmerGroup::PrimaryKey": usersStaffFarmerGroupPrimaryKey,
      "zgPrivilege": zgPrivilege,
      "User_StaffGroup::Name": userStaffGroupName,
      "User_StaffGroup::PrimaryKey": userStaffGroupPrimaryKey,
      "Region": region,
      "IsPasswordChangeNeeded": isPasswordChangeNeeded ?? 0,
    };
  }
}
