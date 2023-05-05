class GifimagePokemon {
  getimag(String name) {
    if (name == 'nidoran-m') {
      name = 'nidoran_m';
    } else if (name == 'nidoran-f') {
      name = 'nidoran_f';
    }

    return 'https://projectpokemon.org/images/normal-sprite/${name.toLowerCase()}.gif';
  }
}
//nidoran-f
//nidoran-m