import 'package:watchlist_bloc_lib/model/contact_data_model.dart';
import 'package:watchlist_bloc_lib/service/network.dart';
import 'package:watchlist_bloc_lib/src/string.dart';

class ContactService {
  var contactdata;

  @override
  Future<List<Contact>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(Strings.contactUrl);
    contactdata = contactFromJson(response);

    return contactdata;
  }
}
