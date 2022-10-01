import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.numOfNotifications);

// generate the responses json helps via
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

// from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);

// to json
  Map<String, dynamic> toJson(CustomerResponse authenticationResponse) =>
      _$CustomerResponseToJson(authenticationResponse);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;

  ContactsResponse(this.email, this.phone, this.link);

// generate the responses json helps via
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

// from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) => _$ContactsResponseFromJson(json);

// to json
  Map<String, dynamic> toJson(ContactsResponse authenticationResponse) =>
      _$ContactsResponseToJson(authenticationResponse);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

// generate the responses json helps via
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

// from json
//   factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
//       _$AuthenticationResponseFromJson(json);

// // to json
//   Map<String, dynamic> toJson(AuthenticationResponse authenticationResponse) =>
//       _$AuthenticationResponseToJson(authenticationResponse);
}
