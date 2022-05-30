import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class RequestEntity {

  final String id;
  final String subject;
  final String letter;
  final List<String> attachments;

  RequestEntity({
    required this.id,
    required this.subject,
    required this.letter,
    required this.attachments
  });

  static RequestEntity fromSnapshot(DocumentSnapshot snap) {
    return RequestEntity(
      id: snap.get('id'),
      subject: snap.get('subject'),
      letter: snap.get('letter'),
      attachments: snap.get('attachments'),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'subject': subject,
      'letter': letter,
      'attachments': attachments
    };
  }

  RequestEntity copyWith({
    String? id,
    String? subject,
    String? letter,
    List<String>? attachments,
  }) {
    return RequestEntity(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      letter: letter ?? this.letter,
      attachments: attachments ?? this.attachments
    );
  }
}
