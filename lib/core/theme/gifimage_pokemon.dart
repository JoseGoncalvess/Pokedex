class GifimagePokemon {
  getimag(String name) {
    if (name == 'Nidoran ♂ (Male)') {
      name = 'nidoran_m';
    } else if (name == 'Nidoran ♀ (Female)') {
      name = 'nidoran_f';
    }

    return 'https://projectpokemon.org/images/normal-sprite/${name.toLowerCase()}.gif';
  }
}
