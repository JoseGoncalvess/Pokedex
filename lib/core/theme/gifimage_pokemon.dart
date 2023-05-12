class GifimagePokemon {
  getimag(String name) {
    if (name == 'nidoran-m') {
      name = 'nidoran_m';
    } else if (name == 'nidoran-f') {
      name = 'nidoran_f';
    } else if (name == 'toxtricity-amped') {
      name = 'toxtricity';
    } else if (name == 'sirfetchd') {
      name = 'sirfetchd';
    } else if (name == 'mr-rime') {
      name = 'mr.rime';
    } else if (name == 'eiscue-ice') {
      name = 'eiscue';
    } else if (name == 'indeedee-male') {
      name = 'indeedee';
    } else if (name == 'morpeko-full-belly') {
      name = 'morpeko';
    } else if (name == 'kubfu') {
      name = 'kubfu';
    } else if (name == 'urshifu-single-strike') {
      name = 'urshifu';
    } else if (name == 'zarude') {
      name = 'zarude';
    } else if (name == 'urshifu-single-strike') {
      name = 'urshifu';
    } else if (name == 'oricorio-baile') {
      name = 'oricorio';
    } else if (name == 'wishiwashi-solo') {
      name = 'wishiwashi';
    } else if (name == 'lycanroc-midday') {
      name = 'lycanroc';
    } else if (name == 'type-null') {
      name = 'type';
    }

    return 'https://projectpokemon.org/images/normal-sprite/${name.toLowerCase()}.gif';
  }
}
//nidoran-f
//nidoran-m

