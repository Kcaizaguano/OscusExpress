bool verificarNumeroCedula(String cedula) {
  // Verificamos si la cédula consta de 10 dígitos
  if (cedula.length == 10) {
    // Obtenemos el dígito de la región (los dos primeros dígitos)
    int digitoRegion = int.parse(cedula.substring(0, 2));

    // Preguntamos si la región es válida en Ecuador (debe estar entre 1 y 24)
    if (digitoRegion >= 1 && digitoRegion <= 24) {
      // Extraemos el último dígito
      int ultimoDigito = int.parse(cedula.substring(9, 10));

      // Agrupamos los pares y los sumamos
      int pares = int.parse(cedula.substring(1, 2)) +
          int.parse(cedula.substring(3, 4)) +
          int.parse(cedula.substring(5, 6)) +
          int.parse(cedula.substring(7, 8));

      // Agrupamos los impares, los multiplicamos por un factor de 2, y si el resultado es > que 9, le restamos 9
      int numero1 = int.parse(cedula.substring(0, 1)) * 2;
      if (numero1 > 9) numero1 -= 9;

      int numero3 = int.parse(cedula.substring(2, 3)) * 2;
      if (numero3 > 9) numero3 -= 9;

      int numero5 = int.parse(cedula.substring(4, 5)) * 2;
      if (numero5 > 9) numero5 -= 9;

      int numero7 = int.parse(cedula.substring(6, 7)) * 2;
      if (numero7 > 9) numero7 -= 9;

      int numero9 = int.parse(cedula.substring(8, 9)) * 2;
      if (numero9 > 9) numero9 -= 9;

      int impares = numero1 + numero3 + numero5 + numero7 + numero9;

      // Calculamos la suma total
      int sumaTotal = pares + impares;

      // Extraemos el primer dígito de la suma total
      int primerDigitoSuma = int.parse(sumaTotal.toString().substring(0, 1));

      // Obtenemos la decena inmediata
      int decena = (primerDigitoSuma + 1) * 10;

      // Obtenemos el dígito validador
      int digitoValidador = decena - sumaTotal;

      // Si el dígito validador es 10, lo tomamos como 0
      if (digitoValidador == 10) digitoValidador = 0;

      // Validamos si el dígito validador es igual al último dígito de la cédula
      return digitoValidador == ultimoDigito;
    } else {
      // La región no es válida
      return false;
    }
  } else {
    // La cédula no tiene 10 dígitos
    return false;
  }
}
