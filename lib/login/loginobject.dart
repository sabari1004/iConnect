import 'package:xml/xml.dart' as xml;

class LoginObject {
  String activeStatus;
  String companyId;
  String email;
  String id;
  String name;
  String photo;
  String userCategory;

  LoginObject(Iterable<xml.XmlElement> obj) {
    activeStatus = obj.first.findElements("activeStatus").first.text;
    companyId = obj.first.findElements("companyId").first.text;
    email = obj.first.findElements("email").first.text;
    id = obj.first.findElements("id").first.text;
    name = obj.first.findElements("name").first.text;
    photo = obj.first.findElements("photo").first.text;
    userCategory = obj.first.findElements("userCategory").first.text;
  }
}
