import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/models/message.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

@RoutePage(name: 'CourseMessagingPage')
class CourseMessagingPage extends HookConsumerWidget {
  const CourseMessagingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();
    final courseMessagesCollectionStream =
        ref.watch(courseMessagesCollectionStreamProvider);
    final firestore = ref.read(firestoreProvider);
    final currentUser = ref.read(userDataStreamProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Chat with $recipientId'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: courseMessagesCollectionStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  return ListView(
                    children: snapshot.data!.docs.reversed
                        .map((DocumentSnapshot document) {
                          final message = MessageModel.fromJson(
                              document.data() as Map<String, dynamic>);
                          final isMe =
                              message.email == currentUser.value?.email;
                          final color = isMe ? Colors.blue : Colors.grey[200];
                          final alignment = isMe
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start;
                          print(message);
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(message.message),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: alignment,
                                  children: [
                                    Text(
                                      message.name,
                                      style: TextStyle(
                                        color:
                                            isMe ? Colors.white : Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      message.time.toString(),
                                      style: TextStyle(
                                        color:
                                            isMe ? Colors.white : Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })
                        .toList()
                        .cast(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () async {
                      final text = messageController.text.trim();
                      if (text.isNotEmpty) {
                        final message = {
                          'name': currentUser.value?.fullName,
                          'email': currentUser.value?.email,
                          'profilePicture':
                              'https://i.redd.it/qyvapot2xjsa1.png',
                          'message': text,
                          'timestamp':
                              DateTime.now().millisecondsSinceEpoch.abs(),
                        };
                        await firestore.firestore
                            .collection('courses')
                            .doc('2023')
                            .collection('Fall')
                            .doc('BqEvW9wUP9DD5r2sryee')
                            .collection('messages')
                            .add(message);
                        messageController.clear();
                      }
                    },
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
