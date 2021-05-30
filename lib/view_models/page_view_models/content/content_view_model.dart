import 'package:connectivity/connectivity.dart';
import 'package:food_delivery_app/mocks/fake_repository.dart';
import 'package:food_delivery_app/models/item/item.dart';
import 'package:food_delivery_app/services/connection.dart';
import 'package:food_delivery_app/services/local_storage.dart';
import 'package:food_delivery_app/view_models/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'content_view_model.g.dart';

class ContentViewModel = _ContentViewModel with _$ContentViewModel;

abstract class _ContentViewModel extends BaseViewModel with Store {
  _ContentViewModel() {
    getItems();
  }

  @observable
  List<Item> items = ObservableList.of(<Item>[]);

  @observable
  bool loading = false;

  @action
  Future getItems() async {
    loading = true;
    var connectivityResult = await Connection.checkConnection();
    if (connectivityResult != ConnectivityResult.none) {
      List<Map<String, Object>> fetchedData = await FakeRespository.items;
      items = fetchedData.map((e) => Item.fromJSON(e)).toList();
      var box = LocalStorage.getItemsBox;
      box.clear();
      box.addAll(items);
    } else {
      var box = LocalStorage.getItemsBox;
      items = box.values.toList();
    }

    loading = false;
    return;
  }

  List<Item> filterItemsByType(List<Item> items, String type) {
    List<Item> _filteredItems = [...items];
    _filteredItems.removeWhere((e) => e.type != type);
    return _filteredItems;
  }
}
