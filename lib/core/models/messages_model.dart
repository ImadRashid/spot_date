import 'package:flutter/material.dart';

class MessagesModel{
  String image, name, message, lastSeen;
  bool haveLock, isLocked;

  MessagesModel({this.image, this.name, this.message,this.lastSeen, this.haveLock = false, this.isLocked = false});
}

List<MessagesModel> messagesList = [
  MessagesModel(
    image: 'assets/images/messages_screen/john.png',
    name: 'Chad',
    message: 'Lorem ipsum dolor sit amet, consetetur deupl',
    haveLock: true,
    isLocked: true
  ),
  MessagesModel(
      image: 'assets/images/messages_screen/chris.png',
      name: 'Chris',
      message: 'You can send a direct message',
      haveLock: true,
      isLocked: false
  ),
  MessagesModel(
      image: 'assets/images/messages_screen/chad.png',
      name: 'John',
      message: 'Lorem ipsum dolor sit amet, consetetur deupl',
    lastSeen: '4 days ago'
  ),
  MessagesModel(
    image: 'assets/images/messages_screen/robert.png',
    name: 'Robert',
    message: 'Lorem ipsum dolor sit amet, consetetur deupl',
    lastSeen: '3 weeks ago'
  ),
  MessagesModel(
      image: 'assets/images/messages_screen/chad.png',
      name: 'John',
      message: 'Lorem ipsum dolor sit amet, consetetur deupl',
      lastSeen: '4 days ago'
  ),
  MessagesModel(
      image: 'assets/images/messages_screen/robert.png',
      name: 'Robert',
      message: 'Lorem ipsum dolor sit amet, consetetur deupl',
      lastSeen: '3 weeks ago'
  )
];