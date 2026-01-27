// ------- projeto -------
print("Projeto de Swift - Sistema da Academia!!")

import Foundation


class Pessoa{
    var nome: String
    var email: String

    init (nome: String, email: String){
        self.nome = nome 
        self.email = email
    }

    func getDescricao() -> String{
        return("""
        nome: \(nome)
        email: \(email)
        """)
    }

}

enum NivelAluno{
    case iniciante
    case intermediario
    case avancado 
}

class Aluno: Pessoa{
    var matricula: String
    var nivel: NivelAluno
    private (set) var plano: Plano

    init(nome: String, email: String, matricula: String, plano: Plano){
        self.matricula = matricula
        self.nivel = .iniciante
        self.plano = plano
        super.init(nome: nome, email: email)
    }

    override func getDescricao() -> String {
        return """
        \(super.getDescricao())
        Matrícula: \(matricula)
        Nível: \(nivel)
        Plano: \(plano.nome)
        """
    }
}

class Instrutor: Pessoa{
     var especialidade: String

     init(nome: String, email: String, especialidade: String) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
     }

     override func getDescricao() -> String {
         return """
        \(super.getDescricao())
        Especialidade: \(especialidade)
        """
     }
}

class Plano{
    var nome: String 


    init(nome:String){
        self.nome = nome
    }

    func calcularMensalidade() -> Double{
        return 0.0
    }
}

class PlanoMensal: Plano{
     init() {
        super.init(nome: "Plano Mensal")
    }

    override func calcularMensalidade() -> Double {
        return 120.0
    }
}

class PlanoAnual: Plano{
    init() {
        super.init(nome: "Plano Anual (Promocional)")
    }
    override func calcularMensalidade() -> Double {
        let valorTotal: Double = 120.0 * 12
        let desconto: Double = valorTotal * 0.20
        let aPagar: Double = (valorTotal - desconto) / 12
        return aPagar
    }
}

// ---------- Testes ----------
/*
let planoM = PlanoMensal()
let planoA = PlanoAnual()

let aluno1 = Aluno(nome: "Carlos", email: "carlos@email.com", matricula: "202301", plano: planoM)
let instrutor1 = Instrutor(nome: "Ana", email: "ana@gym.com", especialidade: "Musculação")

print("--- Aluno ---")
print(aluno1.getDescricao())
print("Mensalidade a pagar: R$ \(aluno1.plano.calcularMensalidade())")

print("\n--- Instrutor ---")
print(instrutor1.getDescricao())
*/

protocol Manutencao{
    var nomeItem: String {get }
    var dataUltimaManutencao: String {get }
    func realizarManutencao() -> Bool
}

class Aparelho: Manutencao{
    var nomeItem: String
    private (set) var dataUltimaManutencao: String

    init (nomeItem: String, dataUltimaManutencao: String){
        self.nomeItem = nomeItem
        self.dataUltimaManutencao = "Nenhuma"
    }

    func realizarManutencao() -> Bool {
        print("Manutencao realizada")
        dataUltimaManutencao = "30/08/2025"
        return true
    }
}

class Aula{
    var nome:String
    var instrutor: Instrutor

    init(nome:String,instrutor: Instrutor){
        self.nome = nome
        self.instrutor = instrutor
    }

    func getDescricao() -> String{
        return ("""
        Nome da Aula: \(nome)
        Nome da instrutor: \(instrutor)
        """)
    }
}

class AulaPersonal: Aula{

    var aluno: Aluno 

    init(nome:String, instrutor: Instrutor, aluno: Aluno){
        self.aluno = aluno
        super.init(nome: nome, instrutor: instrutor)
    }

    override func getDescricao() -> String{
        return super.getDescricao() + ("""
        Aluno da aula particular: \(aluno)
        """)
    }

}

class AulaColetiva:Aula{
    private (set) var alunosInscritos: [String: Aluno]
    let capacidadeMaxima: Int = 25

    override init(nome:String, instrutor: Instrutor){
        self.alunosInscritos = [:]
        super.init(nome: nome, instrutor: instrutor)
    }
    
    func inscrever(aluno: Aluno) -> Bool{
        if (alunosInscritos.count == capacidadeMaxima){
            print("Erro: capacidade Maxima Atingida")
            return false
        } else if ( alunosInscritos[aluno.matricula] != nil){
            print("Erro: esse aluno: \(aluno.nome)ja esta adicionado")
            return false
        } else {
            alunosInscritos[aluno.matricula] = aluno
            print("Sucesso: Aluno \(aluno.nome) inscrito na aula \(self.nome).")
            return true
        }
    }
}

//  ---------- Testes ----------

let planoPadrao = PlanoMensal()
let instrutorJiraya = Instrutor(nome: "Jiraya", email: "jiraya@konoha.com", especialidade: "Ninjutsu")

let aulaLotada = AulaColetiva(nome: "Aulão de Verão", instrutor: instrutorJiraya)

print("\n--- Teste 1: Lotação da Sala ---")
for i in 1...25 {
    // Cria um aluno temporário: Aluno 1, Aluno 2, ...
    let alunoTemp = Aluno(nome: "Aluno \(i)", 
                          email: "aluno\(i)@gym.com", 
                          matricula: "M\(i)",
                          plano: planoPadrao)
    
    _ = aulaLotada.inscrever(aluno: alunoTemp)
}

print("\n--- Teste 2: O Aluno 26 (Aquele que chega atrasado) ---")
// tentar colocar mais um
let alunoAtrasado = Aluno(nome: "João Atrasado", 
                          email: "joao@email.com", 
                          matricula: "M26", 
                          plano: planoPadrao)

let conseguiu = aulaLotada.inscrever(aluno: alunoAtrasado)


