class Localepokemon {
  localpokemon({required String city}) {
    List<String> local = city.split('-');
    if (local[1] == 'city') {
      local[1] = 'Cidade';
    }
    String area = '${local[1]} ${local[0]}';

    return area;
  }
}
