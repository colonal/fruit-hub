class ShippingAddressEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.address,
    this.city,
    this.floor,
    this.phone,
  });

  @override
  String toString() {
    return '$address $floor $city';
  }
}
