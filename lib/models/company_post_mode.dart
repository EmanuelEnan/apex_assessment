class CompanyPostModel {
  String? statusCode;
  String? statusMessage;

  CompanyPostModel({this.statusCode, this.statusMessage});

  CompanyPostModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    return data;
  }
}
