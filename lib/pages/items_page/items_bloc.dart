import 'package:bloc_provider/bloc_provider.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wdb106_sample/model/api.dart';
import 'package:wdb106_sample/model/item_stock.dart';
import 'package:wdb106_sample/model/item_store.dart';

export 'package:wdb106_sample/model/item_stock.dart';

class ItemsBloc implements Bloc {
  final ApiClient client;
  final ItemStore itemStore;
  final ValueObservable<List<ItemStock>> _items;

  ItemsBloc({
    @required this.client,
    @required this.itemStore,
  }) : _items = itemStore.stocks {
    _getItems();
  }

  ValueObservable<List<ItemStock>> get items => _items;

  void _getItems() async {
    itemStore.update(await client.getItemStocks());
  }

  @override
  void dispose() {}
}
