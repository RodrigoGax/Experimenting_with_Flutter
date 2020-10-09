class GroceryProduct {
  const GroceryProduct(
      {this.price, this.name, this.description, this.image, this.weight});

  final double price;
  final String name, description, image, weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 31.00,
      name: 'Aguacate',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/avocado.png',
      weight: '500 g'),
  GroceryProduct(
      price: 37.00,
      name: 'Pitahaya',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/pitahaya.png',
      weight: '500 g'),
  GroceryProduct(
      price: 16.90,
      name: 'Plátano',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/banana.png',
      weight: '1 kg'),
  GroceryProduct(
      price: 19.90,
      name: 'Mango',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/mango.png',
      weight: '500 g'),
  GroceryProduct(
      price: 29.90,
      name: 'Piña',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/pineapple.png',
      weight: '1 kg'),
  GroceryProduct(
      price: 24.80,
      name: 'Cereza',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/cherry.png',
      weight: '500 g'),
  GroceryProduct(
      price: 29.90,
      name: 'Naranja',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet, massa et cursus viverra, lorem purus rhoncus ante, pellentesque consequat dolor arcu id mauris.',
      image: 'assets/orange.png',
      weight: '1 kg')
];
