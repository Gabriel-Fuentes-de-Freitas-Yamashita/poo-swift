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

class Instrututor: Pessoa{
     var especialidade: String

     init(nome: nome, email: email, especialidade: String) {
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
        var valorTotal: Double = 120.0 * 12
        var desconto: Double = valorTotal * 0.20
        var aPagar: Double = (valorTotal - desconto) / 12
        return aPagar
    }
}

// ---------- Testes ----------

let planoM = PlanoMensal()
let planoA = PlanoAnual()

let aluno1 = Aluno(nome: "Carlos", email: "carlos@email.com", matricula: "202301", plano: planoA)
let instrutor1 = Instrutor(nome: "Ana", email: "ana@gym.com", especialidade: "Musculação")

print("--- Aluno ---")
print(aluno1.getDescricao())
print("Mensalidade a pagar: R$ \(aluno1.plano.calcularMensalidade())")

print("\n--- Instrutor ---")
print(instrutor1.getDescricao())