// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Backgroud {
  getBackgroudColor({required String type}) {
    var color;
    Color backgroud = const Color.fromARGB(255, 110, 109, 109);
    if (type == 'flying') {
      backgroud = const Color(0xff9EB1D8);
    } else if (type == 'poison') {
      backgroud = const Color(0xffC36E97);
    } else if (type == 'groud') {
      backgroud = const Color(0xFFF78551);
    } else if (type == 'rock') {
      backgroud = const Color(0xffD4C294);
    } else if (type == 'bug') {
      backgroud = Color.fromARGB(255, 146, 235, 126);
    } else if (type == 'ghost') {
      backgroud = const Color(0xff8571BE);
    } else if (type == 'steel') {
      backgroud = const Color(0xff4C91B2);
    } else if (type == 'fire') {
      backgroud = const Color(0xfffd6b6d);
    } else if (type == 'water') {
      backgroud = const Color(0xff58ABF6);
    } else if (type == 'grass') {
      backgroud = const Color.fromARGB(255, 90, 195, 88);
    } else if (type == 'electric') {
      backgroud = const Color(0xFFFFC107);
    } else if (type == 'ice') {
      backgroud = const Color(0xFf91D8DF);
    } else if (type == 'dragon') {
      backgroud = const Color(0xFF7383B9);
    } else if (type == 'psychic') {
      backgroud = const Color(0xFF785ecc);
    } else if (type == 'dark') {
      backgroud = const Color(0xFF6F6E78);
    } else if (type == 'fairy') {
      backgroud = const Color(0xFFEBA8C3);
    }

    return color = backgroud;
  }

  getBackgroudType({required String type}) {
    var color;
    Color backgroud = const Color.fromARGB(255, 110, 109, 109);
    if (type == 'flying') {
      backgroud = const Color.fromARGB(255, 191, 193, 196);
    } else if (type == 'poison') {
      backgroud = const Color.fromARGB(255, 230, 101, 163);
    } else if (type == 'groud') {
      backgroud = backgroud = const Color.fromARGB(255, 245, 118, 60);
    } else if (type == 'rock') {
      backgroud = const Color.fromARGB(255, 196, 172, 112);
    } else if (type == 'bug') {
      backgroud = const Color.fromARGB(255, 118, 216, 97);
    } else if (type == 'ghost') {
      backgroud = const Color.fromARGB(255, 96, 66, 179);
    } else if (type == 'steel') {
      backgroud = const Color.fromARGB(255, 175, 226, 250);
    } else if (type == 'fire') {
      backgroud = const Color.fromARGB(255, 235, 55, 58);
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
    }

    return color = backgroud;
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