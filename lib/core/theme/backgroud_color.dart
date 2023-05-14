// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Backgroud {
  getBackgroudColor({required String type}) {
    Color backgroud = const Color.fromARGB(206, 78, 75, 75);
    if (type == 'flying') {
      backgroud = const Color.fromARGB(200, 191, 193, 196);
    } else if (type == 'poison') {
      backgroud = Color.fromARGB(146, 218, 83, 148);
    } else if (type == 'ground') {
      backgroud = backgroud = Color.fromARGB(199, 237, 144, 37);
    } else if (type == 'rock') {
      backgroud = const Color.fromARGB(200, 196, 172, 112);
    } else if (type == 'bug') {
      backgroud = const Color.fromARGB(200, 118, 216, 97).withAlpha(180);
    } else if (type == 'ghost') {
      backgroud = const Color.fromARGB(181, 96, 66, 179);
    } else if (type == 'steel') {
      backgroud = const Color.fromARGB(200, 175, 226, 250);
    } else if (type == 'fire') {
      backgroud = const Color.fromARGB(217, 241, 98, 3);
    } else if (type == 'water') {
      backgroud = const Color.fromARGB(174, 18, 138, 243);
    } else if (type == 'grass') {
      backgroud = const Color.fromARGB(214, 46, 181, 44);
    } else if (type == 'electric') {
      backgroud = const Color.fromARGB(180, 255, 191, 0);
    } else if (type == 'ice') {
      backgroud = const Color.fromARGB(190, 33, 206, 221).withAlpha(121);
    } else if (type == 'dragon') {
      backgroud = const Color.fromARGB(200, 77, 96, 158).withAlpha(160);
    } else if (type == 'psychic') {
      backgroud = const Color.fromARGB(192, 124, 93, 227);
    } else if (type == 'dark') {
      backgroud = const Color.fromARGB(199, 33, 32, 36).withAlpha(169);
    } else if (type == 'fairy') {
      backgroud = const Color.fromARGB(181, 227, 154, 183);
    } else if (type == 'fighting') {
      backgroud = const Color.fromARGB(199, 155, 37, 43);
    }

    return backgroud;
  }

  getBackgroudType({required String type}) {
    Color backgroud = const Color.fromARGB(255, 95, 90, 90);
    if (type == 'flying') {
      backgroud = const Color.fromARGB(255, 191, 193, 196);
    } else if (type == 'poison') {
      backgroud = const Color.fromARGB(255, 230, 101, 163);
    } else if (type == 'ground') {
      backgroud = backgroud = const Color.fromARGB(255, 231, 130, 23);
    } else if (type == 'rock') {
      backgroud = const Color.fromARGB(255, 196, 172, 112);
    } else if (type == 'bug') {
      backgroud = const Color.fromARGB(255, 118, 216, 97);
    } else if (type == 'ghost') {
      backgroud = const Color.fromARGB(255, 96, 66, 179);
    } else if (type == 'steel') {
      backgroud = Color.fromARGB(255, 175, 200, 212);
    } else if (type == 'fire') {
      backgroud = const Color.fromARGB(250, 255, 104, 3);
    } else if (type == 'water') {
      backgroud = const Color.fromARGB(255, 18, 138, 243);
    } else if (type == 'grass') {
      backgroud = const Color.fromARGB(255, 66, 224, 64);
    } else if (type == 'electric') {
      backgroud = const Color.fromARGB(255, 255, 191, 0);
    } else if (type == 'ice') {
      backgroud = const Color.fromARGB(255, 108, 243, 255);
    } else if (type == 'dragon') {
      backgroud = const Color.fromARGB(255, 77, 96, 158);
    } else if (type == 'psychic') {
      backgroud = const Color.fromARGB(255, 147, 114, 255);
    } else if (type == 'dark') {
      backgroud = const Color.fromARGB(255, 73, 72, 80);
    } else if (type == 'fairy') {
      backgroud = const Color.fromARGB(255, 255, 185, 213);
    } else if (type == 'fighting') {
      backgroud = const Color.fromARGB(255, 157, 42, 48);
    }

    return backgroud;
  }
}



// .bug {
//     background: #92BC2C;
// }

// .dark {
//     background: #595761;
// }

// .dragon {
//     background: #0C69C8;
// }

// .electric {
//     background: #F2D94E;
// }

// .fire {
//     background: #FBA54C;
// }

// .fairy {
//     background: #EE90E6;
// }

// .fighting {
//     background: #D3425F;
// }

// .flying {
//     background: #A1BBEC;
// }

// .ghost {
//     background: #5F6DBC;
// }

// .grass {
//     background: #5FBD58;
// }

// .ground {
//     background: #DA7C4D;
// }

// .ice {
//     background: #75D0C1;
// }

// .normal {
//     background: #A0A29F;
// }

// .poison {
//     background: #B763CF;
// }

// .psychic {
//     background: #FA8581;
// }

// .rock {
//     background: #C9BB8A;
// }

// .steel {
//     background: #5695A3;
// }

// .water {
//     background: #539DDF;
// }