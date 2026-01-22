import Foundation

print("Aula 3 de Swift!!")

print("Exercício 1: O Cofre Seguro!!")

/*
Exercício 1: O Cofre Seguro
Objetivo: Entender como o controle de acesso private e a lógica de validação protegem
o estado interno de um objeto contra corrupção ou uso indevido. Você construirá uma classe
Cofre que permite apenas operações válidas em seu conteúdo.
Cenário: Você está criando uma classe para representar um cofre digital. O cofre tem um
saldo (balance) que só pode ser modificado através de métodos específicos de
depositar e sacar. O acesso direto ao saldo é proibido, e todas as transações devem
ser validadas para evitar roubos ou erros (por exemplo, depositar um valor negativo).
Instruções:
1. Crie a Classe Cofre:
◦ Defina uma classe chamada Cofre.
◦ Adicione uma propriedade private var saldo: Double. Torná-la
private é o passo mais importante; isso garante que o código fora da classe
Cofre não possa ver ou alterar esse valor diretamente.
2. Crie um Inicializador:
◦ Escreva um init(depositoInicial: Double) que define o saldo
inicial.
◦ Adicione uma verificação dentro do inicializador para garantir que
depositoInicial não seja negativo. Se for, defina o saldo como
0.0 e imprima uma mensagem de aviso.
3. Implemente Métodos Controlados:
◦ Crie um método public func depositar(quantia:
Double). Ele só deve adicionar ao saldo se a quantia for um número
positivo. Caso contrário, deve imprimir um erro e não fazer nada.
◦ Crie um método public func sacar(quantia: Double). Este
método deve verificar duas coisas:
▪ A quantia deve ser positiva.
▪ A quantia deve ser menor ou igual ao saldo atual.
▪ Se qualquer uma das verificações falhar, imprima uma mensagem de
erro apropriada e não modifique o saldo.
4. Adicione um Getter Público:
◦ Crie um método public func getSaldo() -> Double que
retorna o saldo atual. Isso fornece acesso de apenas leitura ao saldo para o
mundo exterior.
Com certeza! Aqui estão todos os três exercícios traduzidos para o português.
Exercício 1: O Cofre Seguro (Encapsulamento e Integridade de Dados)
Objetivo: Entender como o controle de acesso private e a lógica de validação protegem
o estado interno de um objeto contra corrupção ou uso indevido. Você construirá uma classe
Cofre que permite apenas operações válidas em seu conteúdo.
Cenário: Você está criando uma classe para representar um cofre digital. O cofre tem um
saldo (balance) que só pode ser modificado através de métodos específicos de
depositar e sacar. O acesso direto ao saldo é proibido, e todas as transações devem
ser validadas para evitar roubos ou erros (por exemplo, depositar um valor negativo).
Instruções:
1. Crie a Classe Cofre:
◦ Defina uma classe chamada Cofre.
◦ Adicione uma propriedade private var saldo: Double. Torná-la
private é o passo mais importante; isso garante que o código fora da classe
Cofre não possa ver ou alterar esse valor diretamente.
2. Crie um Inicializador:
◦ Escreva um init(depositoInicial: Double) que define o saldo
inicial.
◦ Adicione uma verificação dentro do inicializador para garantir que
depositoInicial não seja negativo. Se for, defina o saldo como 0.0 e
imprima uma mensagem de aviso.
3. Implemente Métodos Controlados:
◦ Crie um método public func depositar(quantia: Double). Ele
só deve adicionar ao saldo se a quantia for um número positivo. Caso
contrário, deve imprimir um erro e não fazer nada.
◦ Crie um método public func sacar(quantia: Double). Este
método deve verificar duas coisas:
▪ A quantia deve ser positiva.
▪ A quantia deve ser menor ou igual ao saldo atual.
▪ Se qualquer uma das verificações falhar, imprima uma mensagem de
erro apropriada e não modifique o saldo.
4. Adicione um Getter Público:
◦ Crie um método public func getSaldo() -> Double que retorna o
saldo atual. Isso fornece acesso de apenas leitura ao saldo para o mundo
exterior
*/

class Cofre{
    private var saldo: Double
    

    init (saldo: Double){
        self.saldo = 0
    }

    public func depositar(quantia: Double){
        if (quantia < 0){
            print("erro, deposito negativo n da")
        } else {
            saldo += quantia
        }
    }

    public func sacar(quantia: Double){
        if(quantia > 0 && quantia <= saldo){
                saldo -= quantia
            }else {
                print("erro ao sacar quantia, ela deve ser positiva e maior que saldo")
            }
        }

         public func getSaldo() -> Double{
            return saldo
         }
     }

     // --- Casos de Teste ---
print("Criando um cofre válido:")
let meuCofre = Cofre(saldo: 100.0)
print("Saldo inicial: \(meuCofre.getSaldo())") // Esperado: 0.0
print("\nTentando criar um cofre inválido:")
let cofreInvalido = Cofre(saldo: -50.0) 
print("Saldo do cofre inválido: \(cofreInvalido.getSaldo())") // Esperado:0.0
print("\n--- Transações ---")
meuCofre.depositar(quantia: 50.0) // VálidoDouble
print("Saldo após depósito: \(meuCofre.getSaldo())") // Esperado: 150.0
meuCofre.depositar(quantia: -20.0) // Inválido
print("Saldo após depósito falho: \(meuCofre.getSaldo())") // Esperado:150.0
meuCofre.sacar(quantia: 30.0) // Válido
print("Saldo após saque: \(meuCofre.getSaldo())") // Esperado: 120.0
meuCofre.sacar(quantia: 200.0) // Inválido (saldo insuficiente)
print("Saldo após saque falho: \(meuCofre.getSaldo())") // Esperado: 120.0
//meuCofre.saldo = 5000.0
// Esta linha deve causar um ERRO, demonstrando que 'saldo' está seguro:

print("----------------------------------------------------------")
print("Exercício 2: O Perfil de Usuário!!")

/*
Exercício 2: O Perfil de Usuário
Objetivo: Usar uma combinação de propriedades imutáveis (let) e diferentes níveis de
acesso (private, public) para criar uma classe PerfilUsuario segura e previsível.
Cenário: Você precisa modelar um perfil de usuário. O id e a dataDeCadastro de um
usuário devem ser definidos uma vez e nunca mais mudar. Seu nomeDeExibicao pode ser
alterado, mas sua senha deve ser armazenada de forma privada e só pode ser atualizada
através de um método seguro que impõe regras.
Instruções:
1. Defina a Classe PerfilUsuario:
◦ Crie uma classe chamada PerfilUsuario.
◦ Adicione uma propriedade imutável public let id: UUID. Este será o
identificador único e imutável do usuário.
◦ Adicione uma propriedade imutável public let dataDeCadastro:
Date.
◦ Adicione uma propriedade mutável public var nomeDeExibicao:
String.
◦ Adicione uma propriedade private var hashDaSenha: String para
armazenar a senha do usuário de forma segura (vamos simular o hashing).
2. Crie um Inicializador Seguro:
◦ O init deve aceitar um nomeDeExibicao e uma senha iniciais.
◦ Dentro do init, inicialize id com UUID(), dataDeCadastro com
Date(), e defina o nomeDeExibicao.
◦ Para a senha, não a armazene diretamente. Defina hashDaSenha como
uma versão "hasheada" dela (ex: senha + "_hashed"). Isso simula uma
prática de segurança unidirecional.
3. Implemente um Método Seguro de Atualização de Senha:
◦ Crie um método public func alterarSenha(novaSenha:
String)
◦ Dentro deste método, adicione uma regra de validação: a novaSenha deve
ter pelo menos 8 caracteres.
◦ Se for válida, atualize o private hashDaSenha com a nova senha
"hasheada". Retorne true.
◦ Se for inválida, imprima uma mensagem de erro e não altere o hash. Retorne
false.
4. Implemente um Método de Autenticação:
◦ Crie um método public func autenticar(senha: String) ->
Bool.
◦ Este método deve "hashear" a senha de entrada da mesma forma que você
fez no init e compará-la com o hashDaSenha armazenado.
◦ Retorne true se corresponderem e false caso contrário. Isso permite
verificar a senha sem nunca expor o hash armazenado.
*/

class PerfilUsuario{
    public let id: UUID
    public let dataDeCadastro:Date
    public var nomeDeExibicao:String
    private var hashDaSenha: String
    

    init (nomeDeExibicao: String,  senha: String){
        self.id = UUID()
        self.dataDeCadastro = Date()
        self.nomeDeExibicao = nomeDeExibicao
        self.hashDaSenha = (senha + "_hashed")
    }

    public func alterarSenha(novaSenha:String)-> Bool{
        if (novaSenha.count >= 8){
            self.hashDaSenha = novaSenha  + "_hashed"
            return true
        } else {
            print("Erro, precisa de pelo menos 8 caracters a nova senha ")
            return false
        }
    }

        public func autenticar(senha: String) -> Bool{
             let hashDeEntrada = senha + "_hashed"
                return hashDeEntrada == self.hashDaSenha
        }

    }


    // --- Casos de Teste ---
let usuario = PerfilUsuario(nomeDeExibicao: "Alex", senha:"senhaSegura123")
print("Usuário \(usuario.nomeDeExibicao) criado com ID: \(usuario.id)")

print("\n--- Autenticação ---")
print("Login com senha correta: \(usuario.autenticar(senha:"senhaSegura123"))")
// Esperado: true
print("Login com senha incorreta: \(usuario.autenticar(senha:"senhaErrada"))")
// Esperado: false
print("\n--- Alteração de Senha ---")
let sucesso = usuario.alterarSenha(novaSenha: "novaSenhaForte456")
print("Alteração de senha bem-sucedida: \(sucesso)")
// Esperado: true
print("Login com senha antiga: \(usuario.autenticar(senha:"senhaSegura123"))")
// Esperado: false
print("Login com nova senha: \(usuario.autenticar(senha:"novaSenhaForte456"))")
// Esperado: true
let falha = usuario.alterarSenha(novaSenha: "fraca")
print("Alteração de senha bem-sucedida: \(falha)")
// Esperado: false & mensagem de erro
print("Login com nova senha (deve ser a antiga ainda): \(usuario.autenticar(senha: "novaSenhaForte456"))")
// Esperado: true