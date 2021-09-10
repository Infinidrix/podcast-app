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
        Name: "The Nasa Channel",
        ImageUrl: "https://www.image.com/image.jpg",
        Subscribers: 200,
        Id: "Another Unique ID",
        Description: "",
        Podcasts: []),
    Channel(
        Name: "Super Awesome",
        ImageUrl: "https://www.image.com/image.jpg",
        Subscribers: 300,
        Id: "Amaze Unique ID",
        Description: "",
        Podcasts: []),
    Channel(
        Name: "Wooden Overcoats",
        ImageUrl: "https://www.image.com/image.jpg",
        Subscribers: 400,
        Id: "Super Cool Unique ID",
        Description: "",
        Podcasts: []),
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
