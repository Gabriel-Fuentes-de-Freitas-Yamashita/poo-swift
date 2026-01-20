import Foundation

print("Aula 1 de Swift!!")

/*

Em uma função, você recebe um array de números inteiros e precisa calcular três proporções: a fração de números positivos, a fração de números negativos e a fração de zeros. Para isso, conte quantos elementos são positivos, quantos são negativos e quantos são iguais a zero, depois divida cada um desses valores pelo total de elementos do array. 
Por fim, imprima cada fração em uma linha separada, sempre com exatamente 6 casas decimais.

Exemplo 1
Entrada:

Array: [Int] = [-4,  3,  -9 , 0 , 4 , 1 ]

Processo:
Positivos: 3 (3, 4, 1) → 3/6 = 0.500000
Negativos: 2 (-4, -9) → 2/6 = 0.333333
Zeros: 1 (0) → 1/6 = 0.166667


*/

print("Atividade 1")

var lista: [Int] = [-4,  3,  -9 , 0 , 4 , 1 ]

func tresProporcoes(lista: [Int]){

    var positivos = 0
    var negativos = 0
    var zeros = 0

    for nums: Int in lista{
        if (nums > 0){
            positivos += 1
        } else if (nums == 0){
            zeros += 1
        } else {
            negativos += 1 
        }
    }

    let totalNums = Double(lista.count)

    let razaoPositivos = Double(positivos) / totalNums
    let razaoNegativos = Double(negativos) / totalNums
    let razaoZeros = Double(zeros) / totalNums
    print("Positivos:", positivos, "-> fração", positivos, "/", totalNums, "=", razaoPositivos )
    print("Negativos:", negativos, "-> fração", negativos, "/", totalNums, "=", razaoNegativos)
    print("Positivos:", zeros, "-> fração", zeros, "/", totalNums, "=", razaoZeros)
}


tresProporcoes(lista: lista)