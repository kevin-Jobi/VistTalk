import '../blocs/message/message_bloc.dart';
import '../blocs/message/message_event.dart';

class MessageViewModel {
  final MessageBloc messageBloc;

  MessageViewModel(this.messageBloc);

  void loadMessages() {
    messageBloc.add(const LoadMessages());
  }
}