import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_app/application/subscription/subscription_events.dart';
import 'package:podcast_app/application/subscription/subscription_states.dart';
import 'package:podcast_app/data_provider/login/login_provider.dart';
import 'package:podcast_app/models/channel/Channel.dart';
import 'package:podcast_app/repository/library_repository/library_repository.dart';
import 'package:podcast_app/repository/subscription_repository/ISubscriptionRepository.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final ISubscriptionRepository subscriptionRepository;
  static List<Channel> channels = [
    Channel(
        name: "The Nasa Channel",
        profile_pic: "https://www.image.com/image.jpg",
        subscriber: 200,
        id: "Another Unique id",
        description: "",
        podcasts: []),
    Channel(
        name: "Super Awesome",
        profile_pic: "https://www.image.com/image.jpg",
        subscriber: 300,
        id: "Amaze Unique id",
        description: "",
        podcasts: []),
    Channel(
        name: "Wooden Overcoats",
        profile_pic: "https://www.image.com/image.jpg",
        subscriber: 400,
        id: "Super Cool Unique ID",
        description: "",
        podcasts: []),
  ];

  SubscriptionBloc(this.subscriptionRepository)
      : super(LoadingSubscriptionState());

  @override
  Stream<SubscriptionState> mapEventToState(SubscriptionEvent event) async* {
    if (event is LoadInitialSubscriptionEvent) {
      yield LoadingSubscriptionState();
      try {
        List<Channel> subscriptionChannels = await subscriptionRepository
            .getSubscribedChannels(LoginProvider.SESSION.getString('userId')!);
        yield InitialSubscriptionState(subscriptionChannels);
      } catch (e) {
        yield FailedSubscriptionState(e.toString());
      }
    } else if (event is UnsubscribeEvent) {
      throw UnimplementedError();
    }
  }
}
