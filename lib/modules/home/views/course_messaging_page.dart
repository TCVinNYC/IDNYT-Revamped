import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
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
    final scrollController = useScrollController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const Text(
                  'Course Messaging',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
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
                    controller: scrollController,
                    reverse: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = MessageModel.fromJson(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>);
                      final isMe = message.email == firestore.userData.email;
                      final color = isMe
                          ? const Color(0xFF3B82F6)
                          : const Color(0xFFF3F4F6);
                      final maxWidth = MediaQuery.of(context).size.width * 0.7;
                      return Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            constraints: BoxConstraints(
                              maxWidth: maxWidth,
                            ),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.only(
                                topLeft: isMe
                                    ? const Radius.circular(12)
                                    : const Radius.circular(0),
                                topRight: isMe
                                    ? const Radius.circular(0)
                                    : const Radius.circular(12),
                                bottomLeft: const Radius.circular(12),
                                bottomRight: const Radius.circular(12),
                              ),
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(message.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        const SizedBox(height: 4),
                                        Text(
                                          message.message,
                                          style: TextStyle(
                                            color: isMe
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _formatDate(message.time),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      maxLines: 3,
                      enableIMEPersonalizedLearning: true,
                      enableInteractiveSelection: true,
                      enableSuggestions: true,
                      scribbleEnabled: true,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
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
                        await firestore.sendCourseMessage(
                            '2023', 'Fall', 'BqEvW9wUP9DD5r2sryee', text);
                        messageController.clear();
                      }
                    },
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(Timestamp timestamp) {
    final date = timestamp.toDate();
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays >= 7) {
      return DateFormat.yMd().add_jm().format(date);
    } else if (difference.inDays >= 2) {
      return DateFormat.E().add_jm().format(date);
    } else if (difference.inDays >= 1) {
      return 'Yesterday at ${DateFormat.jm().format(date)}';
    } else {
      return 'Today at ${DateFormat.jm().format(date)}';
    }
  }
}
