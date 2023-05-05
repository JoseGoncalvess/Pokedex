class SetLastpoekom {
  getlastpoke(String pokebase) {
    String url = pokebase;
    List b = url.split('/');

    return b[6].toString();
  }
}
