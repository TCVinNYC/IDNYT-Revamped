import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/models/message.model.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

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
    // final currentUser = ref.read(userDataStreamProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
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

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = MessageModel.fromJson(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>);
                    print(firestore.userData.email);
                    final isMe = message.email == firestore.userData.email;
                    final color = isMe
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFFF3F4F6);
                    final alignment =
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start;
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(message.profilePicture),
                                radius: 16,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(message.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text(message.message,
                                        style: TextStyle(
                                            color: isMe
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: alignment,
                            children: [
                              Text(
                                message.time.toDate().toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
                      print('sending');
                      await firestore.sendCourseMessage(
                          '2023', 'Fall', 'BqEvW9wUP9DD5r2sryee', text);
                      // final message = {
                      //   'name': currentUser.value?.fullName,
                      //   'email': currentUser.value?.email,
                      //   'profilePicture': 'https://i.redd.it/qyvapot2xjsa1.png',
                      //   'message': text,
                      //   'time': Timestamp.now(),
                      // };
                      // await firestore.firestore
                      //     .collection('courses')
                      //     .doc('2023')
                      //     .collection('Fall')
                      //     .doc('BqEvW9wUP9DD5r2sryee')
                      //     .collection('messages')
                      //     .add(message);
                      messageController.clear();
                      print('sent');
                    }
                  },
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
