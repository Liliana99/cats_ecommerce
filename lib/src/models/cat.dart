class Cat {
  final int? id;
  final String? raza, description, image;

  Cat({this.id, this.raza, this.description, this.image});
}

final Cat cat1 = Cat(
  description: 'Russo',
  raza: 'Russo',
  image: 'assets/images/azul.png',
);

final Cat cat2 = Cat(
  description: 'Russo',
  raza: 'Russo',
  image: 'assets/images/azul.png',
);

List<Cat> cats = [
  Cat(
    id: 1,
    raza: 'Blue Russo cat',
    description:
        'They are affectionate and sweet, although they are shy with strangers and have a tendency to become attached to a single person to whom they are faithful and loyal.',
    image: 'assets/images/azul.png',
  ),
  Cat(
    id: 3,
    raza: 'Norwegian forest cat',
    description: 'Despite their wild looks, they have an affable personality.',
    image: 'assets/images/bosque.png',
  ),
  Cat(
    id: 2,
    raza: 'Angora cat',
    description:
        'This long-haired cat comes from Turkey and is characterized by being intelligent, polite and affectionate.',
    image: 'assets/images/angora.png',
  ),
];
