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

print("---------------------------------------------------")
print("Atividade 2")
/*
1- Crie uma função chamada obterDetalhesVoo que não recebe parâmetros e retorna uma tupla.

2- A tupla de retorno deve conter três valores nomeados: codigo (String), destino (String) e pontual (Bool).

3- Dentro da função, crie e retorne uma tupla com os seguintes dados: código "G3-1405", destino "Rio de Janeiro" e pontual true.

4- Chame a função e armazene o resultado em uma constante chamada detalhesDoVoo.

5- Acesse e imprima os valores da tupla usando os nomes dos elementos para formar uma frase, como: "O voo [código] para [destino] está com o status pontual: [pontual].".

*/
func obterDetalhesVoo() -> (codigo: String, destino: String, pontual: Bool) {
    return (codigo: "G3-1405", destino: "Rio de Janeiro", pontual: true)
}

let detalhesDoVoo = obterDetalhesVoo()

print("""
O voo \(detalhesDoVoo.codigo) para \(detalhesDoVoo.destino) está com o status pontual: \(detalhesDoVoo.pontual)
""" )

print("---------------------------------------------------")
print("Atividade 3")

/*
Crie uma função chamada calcularVendasDoDia que não recebe parâmetros.
Essa função deve retornar uma tupla nomeada contendo as seguintes informações:
produtosVendidos (um Int)
valorTotal (um Double)
clienteDestaque (uma String)
Dentro da função, crie e retorne uma tupla com os seguintes dados fixos: 235 produtos vendidos, valor total de 4750.80 e o cliente destaque "Supermercado ABC".
Fora da função, chame calcularVendasDoDia() e armazene o resultado em uma constante chamada relatorioDeHoje.
Acesse os valores da tupla relatorioDeHoje usando os nomes dos elementos para imprimir no console um relatório formatado exatamente como abaixo:
--- Relatório de Vendas [30/08/2025] ---
Produtos Vendidos: 235 unidades
Valor Total: R$ 4750.80
Cliente Destaque do Dia: Supermercado ABC
------------------------------------

*/

func calcularVendasDoDia() -> (produtosVendidos: Int, valorTotal: Double, clienteDestaque: String){
    return (produtosVendidos: 235, valorTotal: 4750.80, clienteDestaque: "Supermercado ABC")
}

let relatorioDeHoje = calcularVendasDoDia()

print("""
--- Relatório de Vendas [30/08/2025] ---
Produtos Vendidos: \(relatorioDeHoje.produtosVendidos)
Valor Total: R$ \(relatorioDeHoje.valorTotal)
Cliente Destaque do Dia: \(relatorioDeHoje.clienteDestaque)
------------------------------------
""")