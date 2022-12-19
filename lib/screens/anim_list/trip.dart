class Trip {
  final String title;
  final String price;
  final String nights;
  final String img;

  const Trip(
      {required this.title,
      required this.price,
      required this.nights,
      required this.img});
}

final List<Trip> trips = [
  const Trip(
      title: 'Beach Paradise',
      price: '350',
      nights: '3',
      img: 'assets/card_/1.png'),
  const Trip(
      title: 'City Break',
      price: '400',
      nights: '5',
      img: 'assets/card_/2.png'),
  const Trip(
      title: 'Ski Adventure',
      price: '750',
      nights: '2',
      img: 'assets/card_/3.png'),
  const Trip(
      title: 'Space Blast',
      price: '600',
      nights: '4',
      img: 'assets/card_/4.png'),
  const Trip(
    title: 'Beach',
    price: '350',
    nights: '3',
    img: 'assets/card_/5.png',
  ),
  const Trip(
    title: 'City',
    price: '400',
    nights: '5',
    img: 'assets/card_/6.png',
  ),
  const Trip(
    title: 'Ski',
    price: '750',
    nights: '2',
    img: 'assets/card_/7.png',
  ),
  const Trip(
    title: 'Space',
    price: '600',
    nights: '4',
    img: 'assets/card_/8.png',
  ),
];
