import 'package:mobx/mobx.dart';
import 'package:mobx_fluterando/models/item_model.dart';
import 'package:rxdart/rxdart.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {


  final listItems = BehaviorSubject<List<ItemModel>>.seeded([]);
  final filter = BehaviorSubject<String>.seeded('');

  ObservableStream<List<ItemModel>> output;

  _HomeControllerBase() {
    output = Rx.combineLatest2<List<ItemModel>, String, List<ItemModel>>(
      listItems.stream,
      filter.stream,
      (list, filter) {
        if (filter.isEmpty) {
          return list;
        } else {
          return list
              .where((test) => test.title.toLowerCase().contains(filter))
              .toList();
        }
      },
    ).asObservable(initialValue:[]);//Ele inciia com arraylist
  }

  @action
  addItem(ItemModel itemModel) {
    var list =List<ItemModel>.from( listItems.value);
    list.add(itemModel);
    listItems.add(list);
  }



  @action
  setFilter(String value) => filter.add(value);

  @computed
  int get totalChecjd => output.value.where((test) => test.check).length;

  @action
  removeItem(ItemModel model) {
    var list =List<ItemModel>.from( listItems.value);
    list.removeWhere((test) => test.title == model.title);
    listItems.add(list);
  }
}
