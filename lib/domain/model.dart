class SliderObject {
  String title;
  String subtitle;
  String image;

  SliderObject(this.title, this.subtitle, this.image);
}

class Customer {
  int id;
  String name;
  int numberOfNotifications;

  Customer(this.id, this.name, this.numberOfNotifications);
}

class Contacts {
  String phone;
  String link;
  String email;

  Contacts(this.phone, this.link, this.email);
}

class Authentication {
  Customer customer;
  Contacts contacts;

  Authentication(this.customer, this.contacts);
}
