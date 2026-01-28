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


// dia 2


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

/*let planoPadrao = PlanoMensal()
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
*/


// dia 3 

class Academia{
    let nome: String
    private var alunosMatriculados: [String: Aluno]
    private var instrutoresContratados: [String: Instrutor]
    private var aparelhos: [Aparelho]
    private var aulasDisponiveis: [Aula]

    init(nome: String){
        self.nome = nome
        self.alunosMatriculados = [:]
        self.instrutoresContratados = [:]
        self.aparelhos = []
        self.aulasDisponiveis = []
    }

    func adicionarAparelho(_ aparelho: Aparelho){
        aparelhos.append(aparelho)
        print("sucesso ao adicionar a aula: \(aparelho.nomeItem)")
    }

    func adicionarAula(_ aula: Aula){
        aulasDisponiveis.append(aula)
        print("sucesso ao adicionar a aula: \(aula.nome)")
    }

    func contratarInstrutor(_ instrutor: Instrutor){
        instrutoresContratados[instrutor.email] = instrutor
    }

    func matricularAluno(_ aluno: Aluno){
        if (alunosMatriculados[aluno.matricula] != nil){
            print("Erro: Aluno com matrícula: \(aluno.matricula) - já existe.")
        } else {
            alunosMatriculados[aluno.matricula] = aluno
            print("Sucesso ao matricular aluno")
        }
    }

    func matricularAluno(nome: String, email: String, matricula: String, plano: Plano) -> Aluno{
        let novoAluno = Aluno(nome: nome, email: email, matricula: matricula, plano: plano)
        self.matricularAluno(novoAluno)
         
        return novoAluno
         
    }

    func buscarAluno(porMatricula matricula: String) -> Aluno?{
       return alunosMatriculados[matricula]
    }

    func listarAlunos(){
        let ordemAlfabetica = alunosMatriculados.values.sorted { $0.nome < $1.nome }
        if alunosMatriculados.isEmpty == true{
            print("Nenhum aluno matriculado") 
        } else{
            print("--- Lista de Alunos Matriculados ---")
            for aluno in ordemAlfabetica {
                print("\n===============================")
                print(aluno.getDescricao())
                print("===============================")
            }
            print("------------------------------------")
        }
        
    }

    func listarAulas(){
        if aulasDisponiveis.isEmpty == true{
            print("Nenhuma aula cadastrada")
        } else {
            print("--- Lista de Aulas cadastradas ---")
            for aula in aulasDisponiveis{
                print("\n===============================")
                print(aula.getDescricao())
                print("===============================")
            }
            print("------------------------------------")
        }
    }

}


let minhaAcademia = Academia(nome: "Ironberg Tech")
print("\n> Academia '\(minhaAcademia.nome)' inaugurada com sucesso!")


let planoMensal = PlanoMensal()
let planoAnual = PlanoAnual()


let instrutorPaulo = Instrutor(nome: "Paulo Muzy", email: "paulo@birl.com", especialidade: "Musculação")
minhaAcademia.contratarInstrutor(instrutorPaulo)
print("> Instrutor \(instrutorPaulo.nome) contratado.")

// TESTE 1: Matrícula Manual (Primeiro Método)
print("\n--- Teste 1: Matrícula Manual (Objeto Existente) ---")
let alunoJoao = Aluno(nome: "João da Silva", 
                      email: "joao@gmail.com", 
                      matricula: "2024-001", 
                      plano: planoMensal)
minhaAcademia.matricularAluno(alunoJoao)


// Tentando matricular o mesmo aluno de novo (deve dar erro)
print("Tentando duplicar matrícula...")
minhaAcademia.matricularAluno(alunoJoao)


// TESTE 2: Matrícula Direta (Segundo Método - Sobrecarga)
print("\n--- Teste 2: Matrícula Direta (Conveniência) ---")

let alunoMaria = minhaAcademia.matricularAluno(nome: "Maria Souza", 
                                               email: "maria@hotmail.com", 
                                               matricula: "2024-002", 
                                               plano: planoAnual)


let alunoAna = minhaAcademia.matricularAluno(nome: "Ana Clara", 
                                             email: "ana@yahoo.com", 
                                             matricula: "2024-003", 
                                             plano: planoMensal)


// TESTE 3: Listagem (Verificando a Ordem Alfabética)
print("\n--- Teste 3: Listagem Geral ---")

minhaAcademia.listarAlunos()


// TESTE 4: Busca de Aluno
print("\n--- Teste 4: Busca por Matrícula ---")

let matriculaBusca = "2024-002"
if let alunoEncontrado = minhaAcademia.buscarAluno(porMatricula: matriculaBusca) {
    print("✅ Aluno encontrado: \(alunoEncontrado.nome) - Email: \(alunoEncontrado.email)")
} else {
    print("❌ Aluno não encontrado.")
}

let matriculaInexistente = "99999"
if let alunoFantasma = minhaAcademia.buscarAluno(porMatricula: matriculaInexistente) {
    print("Aluno encontrado: \(alunoFantasma.nome)")
} else {
    print("✅ Teste de aluno inexistente funcionou (retornou nil).")
}


// TESTE 5: Gestão de Aulas

print("\n--- Teste 5: Adicionando e Listando Aulas ---")
let aulaSpinning = Aula(nome: "Spinning Intenso", instrutor: instrutorPaulo)
let aulaZumba = AulaColetiva(nome: "Zumba", instrutor: instrutorPaulo)

minhaAcademia.adicionarAula(aulaSpinning)
minhaAcademia.adicionarAula(aulaZumba)

minhaAcademia.listarAulas()


