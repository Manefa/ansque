import 'package:ansque/src/datasource/models/data/entities/request_entity.dart';
import 'package:flutter/material.dart';

@immutable
class RequestModel {
  final String id;
  final String subject;
  final String letter;
  final List<String> attachments;

  const RequestModel({
    required this.id,
    required this.subject,
    required this.letter,
    required this.attachments,
  });

  RequestModel copyWith({
    String? id,
    String? subject,
    String? letter,
    List<String>? attachments
  }) {
    return RequestModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      letter: letter ?? this.letter,
      attachments: attachments ?? this.attachments,
    );
  }

  RequestEntity toEntity() {
    return RequestEntity(id: id, subject: subject, letter: letter, attachments: attachments);
  }

  static RequestModel fromEntity(RequestEntity entity) {
    return RequestModel(
      id: entity.id,
      subject: entity.subject,
      letter: entity.letter,
      attachments: entity.attachments,
    );
  }
}