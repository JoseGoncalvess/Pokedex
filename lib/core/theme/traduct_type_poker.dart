class TraductTypePoker {
  traducttype({required String typepoke}) {
    String pokemontype = '';
    if (typepoke == 'Flying') {
      pokemontype = 'Voador';
    } else if (typepoke == 'Normal') {
      pokemontype = 'Normal';
    } else if (typepoke == 'Poison') {
      pokemontype = 'Venenoso';
    } else if (typepoke == 'Ground') {
      pokemontype = 'Terra';
    } else if (typepoke == 'Rock') {
      pokemontype = 'Pedra';
    } else if (typepoke == 'Bug') {
      pokemontype = 'Inseto';
    } else if (typepoke == 'Ghost') {
      pokemontype = 'Fantasma';
    } else if (typepoke == 'Steel') {
      pokemontype = 'Aço';
    } else if (typepoke == 'Fire') {
      pokemontype = 'Fogo';
    } else if (typepoke == 'Water') {
      pokemontype = 'Água';
    } else if (typepoke == 'Grass') {
      pokemontype = 'Grama';
    } else if (typepoke == 'Electric') {
      pokemontype = 'Elétrico';
    } else if (typepoke == 'Ice') {
      pokemontype = 'Gelo';
    } else if (typepoke == 'Dragon') {
      pokemontype = 'Drgão';
    } else if (typepoke == 'Psychic') {
      pokemontype = 'Psíquico';
    } else if (typepoke == 'Dark') {
      pokemontype = 'Sombrio';
    } else if (typepoke == 'Fairy') {
      pokemontype = 'Fada';
    }
    return pokemontype;
  }
}
