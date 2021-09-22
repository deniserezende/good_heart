import 'dart:convert';

CommunicationWithServer communicationWithServerFromJson(String str) => CommunicationWithServer.fromJson(json.decode(str));

String communicationWithServerToJson(CommunicationWithServer data) => json.encode(data.toJson());

class CommunicationWithServer {
  CommunicationWithServer({
    this.idMsg,
    this.opCode,
  });

  dynamic idMsg;
  dynamic opCode;

  factory CommunicationWithServer.fromJson(Map<String, dynamic> json) =>
      CommunicationWithServer(
        idMsg: json["IdMsg"],
        opCode: json["OpCode"],
      );

  Map<String, dynamic> toJson() =>
      {
        "IdMsg": idMsg,
        "OpCode": opCode,
      };
}