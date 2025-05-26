
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/message/message_bloc.dart';
import '../blocs/message/message_state.dart';
import '../view_models/message_view_model.dart';
import '../navigation/bottom_navigation.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messageBloc = BlocProvider.of<MessageBloc>(context);
    final viewModel = MessageViewModel(messageBloc);

    viewModel.loadMessages();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 247, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 247, 255),
        title: const Text('Messages'),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              return ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(message.senderName),
                subtitle: Text('${message.messageCount} messages'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message.time),
                    const SizedBox(height: 5),
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 1),
    );
  }
}
