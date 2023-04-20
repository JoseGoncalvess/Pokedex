class TraductTypePoker {
  traducttype({required String typepoke}) {
    String pokemontype = 'ERRO';
    if (typepoke == 'flying') {
      pokemontype = 'Voador';
    } else if (typepoke == 'normal') {
      pokemontype = 'Normal';
    } else if (typepoke == 'poison') {
      pokemontype = 'Venenoso';
    } else if (typepoke == 'ground') {
      pokemontype = 'Terra';
    } else if (typepoke == 'rock') {
      pokemontype = 'Pedra';
    } else if (typepoke == 'bug') {
      pokemontype = 'Inseto';
    } else if (typepoke == 'ghost') {
      pokemontype = 'Fantasma';
    } else if (typepoke == 'steel') {
      pokemontype = 'Aço';
    } else if (typepoke == 'fire') {
      pokemontype = 'Fogo';
    } else if (typepoke == 'water') {
      pokemontype = 'Água';
    } else if (typepoke == 'grass') {
      pokemontype = 'Grama';
    } else if (typepoke == 'electric') {
      pokemontype = 'Elétrico';
    } else if (typepoke == 'ice') {
      pokemontype = 'Gelo';
    } else if (typepoke == 'dragon') {
      pokemontype = 'Drgão';
    } else if (typepoke == 'psychic') {
      pokemontype = 'Psíquico';
    } else if (typepoke == 'dark') {
      pokemontype = 'Sombrio';
    } else if (typepoke == 'fairy') {
      pokemontype = 'Fada';
    }
    return pokemontype.toUpperCase();
  }
}
