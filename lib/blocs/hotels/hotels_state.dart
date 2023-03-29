import '../../data/models/hotel.dart';

abstract class HotelsState {
  late List<Hotel> data;
  HotelsState({required this.data});
}

class HotelsInitState extends HotelsState {
  HotelsInitState() : super(data: []);
}

class HotelsLoadingState extends HotelsState {
  HotelsLoadingState() : super(data: []);
}

class HotelsSearchState extends HotelsState {
  late List<Hotel> data;
  HotelsSearchState({required this.data}) : super(data: data);
}

class HotelsErrorState extends HotelsState {
  String errorMessage;
  HotelsErrorState({required this.errorMessage}) : super(data: []);
}

class HotelsUpdatedState extends HotelsState {
  List<Hotel> data;
  HotelsUpdatedState({required this.data}) : super(data: data);
}
