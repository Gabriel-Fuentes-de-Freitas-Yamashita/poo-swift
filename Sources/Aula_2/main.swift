import Foundation

print("Aula 2 de Swift!!")

print("Atividade 1!!")

/*
1 - Crie uma struct chamada Livro.
2 - Adicione as propriedades titulo (String), autor (String) e anoPublicacao (Int).
3 - Implemente um método chamado exibirDetalhes() que imprime no console todas as propriedades do livro.
4 - No seu código principal, crie duas instâncias de Livro e chame o método exibirDetalhes() para cada uma delas.
*/

struct Livro{
    let titulo: String
    let autor: String
    let anoPublicacao: Int


    func exibirDetalhes(){
        print("""
        ----------------------
        Proprioedades do livro: 
        titulo: \(titulo)
        autor: \(autor)
        ano de publicacao: \(anoPublicacao)
        ------------------------------------
        """)
    }

    init(titulo: String, autor: String, anoPublicacao: Int){
        self.titulo = titulo
        self.autor = autor
        self.anoPublicacao = anoPublicacao
    }
}

let livro1 = Livro( titulo:"Algoritmos e programacao", autor: "Gabriel", anoPublicacao: 2026)
let livro2 = Livro( titulo:"Swift para newbas", autor: "Gabriel", anoPublicacao: 2025)

livro1.exibirDetalhes()
livro2.exibirDetalhes()

print("---------------------------------------------------")
print("Atividade 2!!")

/*
1 - Crie um enum chamado EstacaoDoAno com os casos primavera, verao, outono e inverno.

2 - Crie uma class chamada Calendario que contenha um método estático chamado getMensagem(para estacao: EstacaoDoAno) -> String.

3 - Dentro desse método, use uma estrutura switch para retornar uma String diferente para cada estação.

4 - No seu código principal, chame o método getMensagem para cada uma das estações e imprima o resultado.

*/

enum EstacaoDoAno{
    case primavera
    case verao
    case inverno
    case outono
}

class Calendario{
    static func getMensagem(para estacao: EstacaoDoAno) -> String{
        switch estacao {
            case .primavera:
                return ("eh primavera")
            case .verao:
                return ("eh verao")
            case .outono:
                return ("eh outono")
            case .inverno:
                return ("eh inverno")
        }
    }
}

let mensagemVerao = Calendario.getMensagem(para: .verao)
print(mensagemVerao)
let mensagemInverno = Calendario.getMensagem(para: .inverno)
print(mensagemInverno)
let mensagemOutono = Calendario.getMensagem(para: .outono)
print(mensagemOutono)
let mensagemPrimavera = Calendario.getMensagem(para: .primavera)
print(mensagemPrimavera)

print("---------------------------------------------------")
print("Atividade 3!!")

/*
Crie uma class Pedido que representa um pedido online. O status deste pedido será gerenciado por uma enum StatusPedido.

Crie um enum chamado StatusPedido com os casos recebido, processando, enviado e entregue.
Crie uma class chamada Pedido com as propriedades id (Int), descricao (String) e status (do tipo StatusPedido).
Implemente um método na class Pedido chamado atualizarStatus(novoStatus: StatusPedido) que altera o status do pedido para o valor fornecido.
No seu código principal, crie uma nova instância de Pedido com o status inicial recebido e, em seguida, chame o método atualizarStatus para mudar o status para enviado e depois para entregue.

*/

class Pedido{
    var id: Int
    var descricao: String
    var status: StatusPedido

    func atualizarStatus(novoStatus: StatusPedido){
        status = novoStatus
    }

    init (id: Int, descricao: String, status: StatusPedido){
        self.id = id
        self.descricao = descricao
        self.status = status
    }
}

enum StatusPedido{
    case recebido
    case processando 
    case enviado
    case entregue 
}

let pedido1 = Pedido(id: 1, descricao: "pedido legal :)", status: .recebido)
print("Status atual: \(pedido1.status)")
print("--------------------------")
pedido1.atualizarStatus(novoStatus: StatusPedido.enviado)
print("Status atual: \(pedido1.status)")
print("--------------------------")
pedido1.atualizarStatus(novoStatus: StatusPedido.entregue)
print("Status atual: \(pedido1.status)")
print("--------------------------")