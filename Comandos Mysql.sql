# ******************************** BANCO DE DADOS ********************************* #

# Criando uma banco de dados:
create database if not exists nomeDoBanco; -- Criando um bancode dados.

# Informando qual banco de dados quer usar:
use nomeDoBanco; -- Selecionando o banco que quer usar.

# Exibindo todos bancos de dados:
show databases; -- Exibe todos os bancos de dados do mysql.

# Exibindo o banco de dados que está em seu uso no momento:
select database(); -- Mostra o banco de dados que eu estou usando no momento.

# Deletando um banco de dados:
drop database if exists nomeDoBanco; -- Excluindo o banco de dados.

# *********************************** TABELAS **************************************#

# Criando uma tabela:
create table if not exists tabelaBanco( -- Criando a tabela.
-- Colocar os atributos.
);

# Inserido dados em um tabela:
insert into nomeDaTabela (Valor1, Valor2) values ('Valor', 'Valor'); -- Inserindo valor na tabela.

# Criando uma tabela apartir de outra... Porém importando dados somente daqueles que o Estado por igual a 'SP':
create table if not exists Programadores (
select * from funcionario where c_estaclien = 'SP'
); -- Obs: Esta tabela não pode ser alterada após ser criada e os dados forem importandos.

# Alterando o auto_increment:
alter table comclien auto_increment = 100;

# Adicionando uma coluna em uma determinada tabela:
alter table nomeDaTabela add nomeDaColuna [tipo de dado] [constraints]; -- Adicionando um coluna em uma tabela.

# Deletando uma coluna de um determinada tabela:
alter table nomeDaTabela drop  column nomeDacoluna; -- Apagando um coluna de uma tabela.

# Alterando o nome da tabeLa:
alter table Tabela 
rename to novoNomeDaTabela;

# Alterando o nome da coluna:
alter table Tabela
change column nomeColunaAntiga nomeColunaNova varchar(100)null default null ;

# Alterando o tipo de dado de um determinada coluna:
alter table Tabela modify column Coluna [tipoDeDado]; -- Alterando o tipo de dado da coluna.

# Mudando a coluna de posição em uma determinada Tabela:
alter table nomeDaTabela 
change column Amigos Amigos tinyint(1) not null after id; -- Alterando a coluna de posição... Colocando a coluna Amigos atrás de id.

#Adicionando uma chave estrangeira em uma tabela:
-- 1º Criar a coluna na qual será o atributo da chave estrangeira ->
alter table Tabela2 add column id_Tabela1 smallint not null;
-- 2º Adicionando a chave estrangeira ->
alter table Tabela2 add constraint fk_id_Tabela1
foreign key (id_Tabela1)
references Tabela1(id)
on delete no action
on update no action;

# Deletando a chave estrangeira:
alter table Tablea drop foreign key
fk_tablea2_tabela1;

# Deletando uma tabela:
drop table if exists nomeDaTabela; -- Excluindo tabela.

# ************************************** INSERT'S ***************************************#

# Inserindo dados em uma tabela:
insert into nomeDaTabela (coluna1, coluna2) values ('valor1', 'valor2');

# Criando e inserindo dados de outra tabela:

create table comcontato( -- Criando a tabela no qual será inserido dados de um determinada tabela, na ordem das colunas.
n_numecontato int not null auto_increment,
c_nomecontato varchar(200),
c_fonecontato varchar(30),
c_cidacontato varchar(200),
c_estacontato varchar(2),
n_numeclien int,
primary key(n_numecontato));

# Populando as colunas da tabela comcontato com as seguintes informações que temos na outra tabela.
insert into comcontato( -- Inserindo os dados na tabela comcontato criada anteriormente com os dados selecionados...
select
n_numeclien,
c_nomeclien,
c_foneclien,
c_cidaclien,
c_estaclien,
n_numeclien
from comclien); -- comclien

# *************************************** SELECT'S **************************************#

# Retornando dados de uma tabela:
select * from nomeDaTabela; -- Puxando todos os dados da tabela.

# Retornando dados de uma tabela, porém, determinando quais colunas:
select coluna1, coluna2, coluna3 from nomeDaTabela; -- Puxando dados especificando as colunas da tabela.

# Retornando dados de uma tabela, porém determinando quais colunas e de qual pessoa:
select coluna1, coluna2, coluna3 from nomeDaTabela where id = 1; -- Puxando dados da tabela espeficiando de quem.

# Retornando dados de um determinada tabela ordenada:
select * from nomeDaTabela order by nomeDaColuna asc; -- Exibindo os dados, ordenados de ordem crescente.
select * from nomeDaTabela order by nomeDaColuna desc; -- Exibindo os dados, ordenados de ordem decrescente.

# Contando quantos registros tem em uma determinada tabela:
select count(*) from nomeDaTabela; -- Exibindo quantos registros existe na tabela;
select count(distinct nomeDaColuna) from nomeDaTabela; -- Exibindo quantos registros tem em uma coluna, porém sem vim repetidos.
select max(nomeDaColuna) from nomeDaTabela; -- Exibe o maior valor de uma determinada coluna da tabela.
select min(nomeDaColuna) from nomeDaTabela; -- Exibe o menor valor de uma determinada coluna da tabela.
select avg(nomeDaColuna) from nomeDaTabela; -- Exibe a média de todos os registros de uma determinada coluna de uma tabela.
select sum(nomeDaColuna) from nomeDaTabela; -- Soma todos os registros de uma determinada coluna de uma tabela.

# Retornando dados de uma determinada Tabela com a clausula between
select * from nomeDaTabela where nomeDaColuna between valor1 and valor2; -- Exibe os dados entre um determinado tempo.
select coluna1, coluna2 from nomeDaTabela where coluna1 between valor1 and valor2; -- Agora especificando as colunas.

# Exibindo resultados entre duas tabelas:
select distinct Nome, Area, Salario from funcionario as F, departamento as D where F.id = D.Funcionario_id;

# Exibindo registros de mais de um cliente com a clausula where:
select coluna1, coluna2, coluna3
from Tablea where coluna1 in (1,2); -- Espeficiando id 1 e id 2, e trazendo resultado desses dois.

# Exibindo dados... Porém especificando quais devem ficar de fora:
select coluna1, coluna2, coluna3
from Tablea where coluna1 not in (1,2); -- Espeficificando que id 1 e id 2 devem ficar de foram dessa consulta de dados.

# Exibindo registros, porém, especificando qual deve não vim:
select coluna1, coluna2, coluna3
from Tablea where coluna1 <> '0001'; -- <> sinal de diferente.

# Exibindo dados de um determinada tabela, porém, especificando quais registros:
select * from nomeDaTabela where nomeDaColuna like 'F%'; -- Exibe todos os registros que começa com a letra F.
select * from nomeDaTabela where nomeDaColuna not like 'S%'; -- Exibe todos os registros tirando aqueles que começa com a letra S.
select nomeDaColuna from nomeDaTabela where nomeDaColuna like '_I'; -- Exibe os registros, porém quando o segundo caracter for com a letra i.

# Exibindo registros de funcionarios que possuiem departamento:
select Nome
from funcionario as F
where F.id in (select Funcionario_id
from departamento as D
where D.Funcionario_id);

# Exibindo funcionario que não tem departamento:
select Nome
from funcionario as F
where F.id not in (select Funcionario_id
from departamento as D
where D.Funcionario_id);

# Retornando os dados de todos os funcionarios ligados a tabela departamento.
select Nome, (select Area from departamento where Funcionario_id = funcionario.id) from funcionario;

# Exibindo registros agrupados:
select Coluna, sum(coluna) as Apelido
from Tabela group by ColunaNaQualQuerAgrupar; -- Agrupando consultas
#Outro exemplo:
-- select Coluna, count(*) as Apelido
-- from Tabela group by ColunaNaQualQuerAgrupar;

select Coluna, sum(coluna) as Apelido
from Tabela group by Coluna having sum(coluna) < 2000; -- O having esta sendo como uma filtragem para retornar dados em uma consulta... Já que o between e where não funciona neste tipo de filtragem.

# Inner join - Trás resultados de registros que tem dados em ambas tabelas.
select coluna, coluna from Tabela1 as Apelido1
inner join Tabela2 as Apelido2
on Apelido1.id = Apelido2.id_Tabela2; -- Consulta ligado a outra tabela... Lembre-se! Inner Join trás todos os resultados em que ambas tabelas tem algo inserido. Somente!

-- Outro exemplo: Desta vez especificando de quem vem a consulta...
select coluna, coluna from Tabela1 as Apelido1
inner join Tabela2 as Apelido2
on Apelido1.id = Apelido2.id_Tabela2 where coluna.nome = 'Hugo Vidal'; -- Trás os resultados, porém só do Hugo Vidal.

# Left Join - trás resultados de registros que tem dados da tabela esquerda, mesmo se não haver registro nenhum.
select coluna, coluna from Tabela1 as Apelido1
left join Tabela2 as Apelido2
on Apelido1.id = Apelido2.id_Tabela2;

# right join - o inverso de left join, trás os registros da tabela a direita, mesmo se não houver registro nenhum.
select coluna, coluna from Tabela1 as Apelido1
right join Tabela2 as Apelido2
on Apelido1.id = Apelido2.id_Tabela2;

# Contatenar strings:
select concat('Nome', 'Sobrenome') as 'Meu nome'; -- Contatenando 'Nome' + 'Sobrenome' = Nome Sobrenome.

select concat(Nome_pessoa, ' ', Sobrenome) -- Contatenando Nome_pessoa (coluna de uma determinada tabela) + ' ' + sobrenome (também de um determinada tabela) da tabela Tabela, resultado = 'Hugo Vidal'.
as 'Nome Completo' from Tabela;

select concat('Eu gosto do livro', Nome_Livro) -- Contatenando a frase 'Eu gosto do livro' + Nome_Livro (coluna de uma determinada tabela) da tabela Tabela.
from Tabela where id = 1;

select concat('A quantidade adquirida é ', ' ', coluna)
from tabela where coluna = 'Teclado';

-- Obs: Se existir valores nulos na coluna na qual esta contatenando strings
-- nao será exibido nada! Por isso pode se utilizar o seguinte método:

select concat('A quantidade adquirida é ', ' ', ifnull(coluna, 0)) -- Neste caso, ele verifica, se a coluna for null, ele substituará o resultado pelo 0.
from tabela where coluna = 'Teclado';

-- Com a função coalesce:
select concat('A quantidade adquirida é ', ' ', coalesce(null, coluna, 0)) -- Verifique cada um dos parametros até encontrar um valor diferente de null e exibi-lo
from tabela where coluna = 'Teclado';

# ************************************** UPDAT'S **************************************#

# Atualizando o dado de uma coluna de um determinada tabela:
update nomeDaTabela set nomeDaColuna = novoValorParaInserir where id = 1; -- Atualizando dados de uma determinada coluna.
update nomeDaTabela set nomeDaColuna1 = novoValor, nomeDaColuna2 = novoValor where id = 1; -- Mais de um dado.

rollback; -- Utilize o rollback para desfazer uma alteração que acabou de fazer na utualização de algum registro por exemplo.

# ************************************** DELET'S ************************************* #

# Deletando apenas um registro de uma tabela;
delete from nomeDaTabela where id = 1;

# Deletando registro do funcionario que não possui um departamento.
delete from funcionario
where id not in (select Funcionario_id
from departamento );

# Deletando registro do funcionario que possui um departamento.
delete from funcionario
where id in (select Funcionario_id
from departamento );


# ******************************** OPERAÇÕES - MATEMATICA *************************** #
-- + = Soma
-- - = Subtração
-- / = Divisão
-- * = Multiplicação
-- mod = Resto de divisão
-- DIV = Divisão inteira

-- Exemplos:
select 2 * 9 / 3;

select coluna1, coluna2 / 2 as 'Preço da coluna por 50% de desconto' -- Exibindo preços de uma coluna da tabela Tabela, porém todos dividos por 2.
from Tabela;

select 10 / 3; -- Divisão normal
select 10 mod 3; -- Resto de divisão

ceiling() -- Arredonda para cima
floor()   -- Arredonda para baixo
pi()      -- Retorna o valor de pi
pow(x,y)  -- Retorna x elevado a y
sqrt()    -- Raiz quadrada de um argumento
sin()     -- Retorna o seno de um número dado em radianos
hex()     -- Retorna a apresentação hexadecimal de um valor decimal

-- Exemplos:

select Coluna, ceiling(coluna * 5) -- Vai arredondar o resultado para cima.
from Tabela;

select pow(2,4); -- 2 elevado a 4

select sqrt(81); -- Raiz quadrada de 81

select hex(1200); -- Mostra o resultado em hexadecimal.

# ************************************ DATAS E HORAS ************************************* #

# Retorna a data atual:
select curdate();

# Retorna a data e hora atual:
select now();

# Retornando somente a hora atual:
select curtime();

# Formatando a data:
select date_format('2015-01-10',get_format(date,'EUR'));
select str_to_date('01.01.2015',get_format(date,'USA'));

# ************************************** FUNÇÕES **************************************** #

create function Nome_DaFuncao(Numero1 int, Numero2 int) -- Criando uma função para somar dois numero e retornar o resultado.
returns int
return Numero1 + Numero2;

-- Como utilizar:
select Nome_DaFuncao(5,5); -- Chamando a função e passando valores para retornar o resultado.

select Coluna, Nome_DaFuncao(coluna, 5) -- Dessa vez utilizando uma coluna de um determinada tabela do banco na função.
from tabela where id = 1; -- Especificando para quem foi feita a utilização desta função.

# Criando uma função para calcular o aumento de um determinado salario:
delimiter $$
CREATE function calculaSalariosComAumento1(salario double, aumento double)
returns double
BEGIN
return ((salario / 100) * aumento) + salario;
END$$
delimiter ;
-- Como utilizar:
select calculaSalariosComAumento(100,30);

# Criando uma função para exibir o nome do funcionario através da matricula fornecida:
delimiter $$
create function nomeDoFuncionario(Matricula varchar(50))
returns varchar(100)
begin
declare buscaNome varchar(50);
select Nome from funcionario as F
inner join departamento as D
on F.id = D.Funcionario_id
where D.Matricula = Matricula into buscaNome; -- Inserindo o nome do funcionario encontrado dentro da variavel buscaNome.
return buscaNome;
end$$
delimiter ;
-- Como utilizar:
select nomeDoFuncionario('88675');

# Utilizando condições a nivel de programação com if else:
delimiter $$
create function alterandoSalarios1(salario double, aumento double)
returns double
begin
	 declare novoSalario double;
     if salario <= 500 then
		set novoSalario = salario + aumento;
     elseif salario >= 1000 then
		set novoSalario = salario + aumento;
     else
		set novoSalario = 0;
     end if;
     return novoSalario;
end$$
delimiter ;
# Como utilizar:
select alterandoSalarios1(1500, 150);

# Utilizando condições a nivel de programação com case:
delimiter $$
create function alterandoSalarios2(salario double, aumento double)
returns double
begin
	 declare novoSalario double;
     case
     when salario <= 500 then
		set novoSalario = salario + aumento;
     when salario >= 1000 then
		set novoSalario = salario + aumento;
     else
		set novoSalario = 0;
     end case;
     return novoSalario;
end$$
delimiter ;
# Como utilizar:
select alterandoSalarios2(500, 150);

# ***************************************** PROCESSOS ****************************************** #

# Criando procedimentos: Retornar os nomes dos funcionarios que trabalham na área de programação:
delimiter $$
create procedure buscaDeFuncionario (areaDeTrabalho varchar(50))
begin
select Nome from funcionario as F
inner join departamento as D
on F.id = D.Funcionario_id
where D.Area = areaDeTrabalho;
select "Efetuado com sucesso!";
end$$
delimiter ;
-- Como utilizar:
call buscaDeFuncionario('Programação');

# Criando um procedimento para buscar um funcionario pela matricula:
delimiter $$
create procedure buscarPelaMatricula (in Matricula varchar(50), out NFuncionario varchar(50)) -- "out" permite o valor encontrado na buscar, ser retornado para fora do procedimento e assim ser usado.
begin
select Nome into NFuncionario from funcionario as F -- Inserindo o nome do funcionario encontrado dentro da variavel NFunconario.
inner join departamento as D
on F.id = D.Funcionario_id
where D.Matricula = Matricula;
end$$
delimiter ;
# Como utilizar:
call buscarPelaMatricula('55667', @NFuncionario); -- Fazendo a consulta e recebendo o resultado na variavel @NFuncionario.
select @NFuncionario; -- Consultando a variavel @NFuncionario.

# Criando um procedimento para aumentar o salario... Porém diferente.
delimiter $$
create procedure calculaSalariosComAumento2(inout salario double, aumento double) -- O "inout" me permite inserir um valor, e ao mesmo tempo esse valor pode ser alterado na consulta e me retornado para fora como o "out".
begin
set salario = ((salario / 100) * aumento) + salario;
end$$
delimiter ;
-- Como utilizar:
set @valorSalario = 100;
call calculaSalariosComAumento2(@valorSalario,30);
select @valorSalario;

# ************************************ ESTRUTURA DE REPETIÇÃO ********************************** #

# Estrutura de repetição 1 -> Loop:
delimiter $$
create procedure acumula1 (limite int)
begin
	declare contador int default 0;
    declare soma int default 0;
    loop_teste: loop -- "loop_teste" rotulo do loop 
		set contador = contador + 1;
        set soma = soma + contador;
        if contador >= limite then -- Condição para parar o loop
			leave loop_teste; -- Saindo do loop
		end if; -- Finalizando o if
        end loop loop_teste; -- Finalizando o loop
        select soma; -- Exibindo a soma
end$$
delimiter ;
# Como utilizar:
call acumula1(10);

# Estrutura de repetição 2 -> reapeat: Com erro!
delimiter $$
create procedure acumula2 (limite int)
begin
	declare contador int default 0;
    declare soma int default 0;
    repeat 
		set contador = contador + 1;
        set soma = soma + contador;
        until contador >= limite -- Condição para parar o loop
        end repeat; -- Finalizando o loop
        select soma; -- Exibindo a soma
end$$
delimiter ;
# Como utilizar:
call acumula2(10); -- Obs o valor inserido como 0 da problema pois retorna 1.

# Estrutura de repetição 3 -> repeat: Sem erro!
delimiter $$
create procedure acumula3 (limite int)
main :begin
	declare contador int default 0;
    declare soma int default 0;
    if limite < 1 then
		select 'O valor deve ser maior que 0' as Erro;
        leave main; -- Saia do procedure se o valor for menor que 0
        end if;
    repeat 
		set contador = contador + 1;
        set soma = soma + contador;
        until contador >= limite -- Condição para parar o loop
        end repeat; -- Finalizando o loop
        select soma; -- Exibindo a soma
end$$
delimiter ;
# Como utilizar:
call acumula3(0);

# Estrutura de repetição 4 -> while: Este já não precisa mais a verificação para o 0
delimiter $$
create procedure acumula4 (limite int)
main :begin
	declare contador int default 0;
    declare soma int default 0;
    while contador < limite do
		set contador = contador + 1;
        set soma = soma + contador;
	end while; -- Finalizando o loop
	select soma; -- Exibindo a soma
end$$
delimiter ;
# Como utilizar:
call acumula4(10);

# Estrutura de repetição 5 -> loop com interate:
delimiter $$
create procedure acumula5 (limite int)
begin
	declare contador int default 0;
    declare soma int default 0;
    loop_teste: loop -- "loop_teste" rotulo do loop 
		set contador = contador + 1;
        set soma = soma + contador;
        if contador < limite then -- Verifica se chegou ao limite dado pelo usuario... Se não:
			iterate loop_teste; -- Retornando ao inicio do loop
		end if; -- Finalizando o if
        leave loop_teste; -- Saindo do loop
	end loop loop_teste; -- Finalizando o loop
	select soma; -- Exibindo a soma
end$$
delimiter ;
# Como utilizar:
call acumula5(0);

# ************************************** TRIGGER'S *********************************** #

# Criando um trigger para calcular e inserir o valor do desconto automaticamente na coluna preco_desconto.
create trigger tr_desconto before insert
on produto
for each row
set new.Preco_Desconto = (new.Preco_Normal * 0.90);
# --
timing = before | after
operação = insert | update | delete

# Trigger para criar automaticamente a função do funcionario:
delimiter $$
create trigger Funcao_Programacao
before insert on departamento for each row
begin
if(new.Area = 'Programação') then
set new.Funcao = 'Programador Csharp';
end if;
end$$
delimiter ;

# Como excluir uma trigger:
drop trigger Funcao_Programacao;







# ************************ [[[[[[[[[[[[[[[[[[[[[ Exemplos de trigger ]]]]]]]]]]]]]]]]]]]]]]]] ****************************** #
-- {

delimiter $$
create trigger Calculo_Comissao -- Criando a trigger;
before insert on Venda for each row -- Informando a tabela na qual ela ira disparar;
begin
declare Valor_Do_Produto double; -- Declarando uma variavel para receber o valor do produto;
declare Valor_Da_Bonificacao double; -- Declarando uma variavel para receber o valor da bonificação do funcionario;
declare Calculo double; -- Declarando uma variavel para receber o valor do calculo do produto junto a bonificação;
select Pegando_Valor_Do_Produto(new.Produto_id) into Valor_Do_Produto; -- Enviando o id do produto para funcao para verificar qual o produto e inserir o seu valor na variavel;
select Pegando_Valor_Bonificacao(new.Funcionario_id) into Valor_Da_Bonificacao; -- Enviando o id do funcionario para funcao para verificar qual é o funcionario e inserir o valor da bonificação na variavel;
set Calculo = ((Valor_Do_Produto / 100) * Valor_Da_Bonificacao); -- Fazendo o calculo da comissao do funcionario;
call Comissao (Calculo, new.Funcionario_id); -- Executando a procedure criada para atualizar a comissao do funcionario.
end$$
delimiter ;

delimiter $$
create function Pegando_Valor_Do_Produto(ProdutoID smallint) -- Criando a função para pegar o valor do produto - utilizada pela trigger;
returns double -- Retornando um valor double;
begin
declare Valor_Do_Produto double; -- Declarando uma variavel que receberá o valor do produto que será buscado;
select I_Valor into Valor_Do_Produto from Produto where id = ProdutoID; -- Selecionando o valor do produto e inserindo na variavel;
return Valor_Do_Produto; -- Retornando o valor do produto.
end$$
delimiter ;

delimiter $$
create function Pegando_Valor_Bonificacao(FuncionarioID smallint) -- Criando a função para pegar a bonificação do funcionario - utilizada pela trigger;
returns double -- Retornando um valor double;
begin
declare Valor_Da_Bonificacao double; -- Declarando uma variavel que receberá o valor da bonificação;
select Bonificacao into Valor_Da_Bonificacao from Sistema where Funcionario_id = FuncionarioID; -- Selecionando o valor da bonificação e inserindo na variavel;
return Valor_Da_Bonificacao; -- Retornando o valor da bonificação.
end$$
delimiter ;

delimiter $$
create procedure Comissao (Valor_Comissao double, FuncionarioID smallint) -- Criando a procedure para atualizar a comissao do funcionario - utilizada pela trigger;
begin
declare Nova_Comissao double; -- Declarando a variavel para receber o valor da comissão anterior + a nova comissao;
select I_Comissao into Nova_Comissao from Sistema where Funcionario_id = FuncionarioID; -- Primeiro buscar qual é o funcionario que fez a venda e qual é sua comissao anterior;
set Nova_Comissao = Nova_Comissao + Valor_Comissao; -- Calculando a comissao anterior, com a nova comissão;
update Sistema set I_Comissao = Nova_Comissao where Funcionario_id = FuncionarioID; -- Atualizando a comissao do funcionario.
end$$
delimiter ;


-- } ******************* [[[[[[[[[[[[[[[ Fim do exemplo da trigger ]]]]]]]]]]]]]]]]]]]] ************************






# ************************************** EVENTOS *********************************** #

delimiter $$
create event inserir_dados
on schedule every 1 second -- Informando a quantos segundo esse evento será disparado;
starts current_timestamp -- Inciando o evento;
ends current_timestamp + interval 2 minute -- Determinando quando deve parar;
do begin
insert into LCfuncionario (C_Nome, C_Cpf, C_Cnpj, C_Sexo, D_DataNasc, C_Telefone, C_Celular, C_Email)
values ('Anonymou', '076.646.136-685', '5675869708', 'M', 19851201, '(61) 0000 - 0000', '(61) 0000 - 0000', 'anonymou@hotmail.com');
end$$
delimiter ;

# Dessa vez será executado uma vez por semana dando inicio na data informada ->
delimiter $$
create event inserindo_anonymou
on schedule every 1 week starts '2015-09-25 16:25:01' -- Obs: Esse evento ele não para! pois não determinamos o "ends" como no anterior;
do
begin
insert into funcionario (Nome, Identidade, Cpf, dataNascimento, -- Comando a ser executado 1 vez por semana;
Endereco, Cidade, Estado, Telefone, Celular, Email)
values ('Anonymou', '867543231', '654.257.157-264',19941201, 'qnn18', 'Barra', 'Bahia', '57689876', '43546788', 'anonymou1@hotmail.com');
end$$
delimiter ;

-- deletando um evento:
drop event inserir_dados;

-- Ativando eventos
set global event_scheduler = on;

# *********************************** CRIANDO USUÁRIOS E DANDO PRIVILEGIOS ***************************** #

# Privilegios, Nivel Global - Se aplica a todos os bancos de dados de um determinado servidor:
grant all on *.* to novoUsuario@'%' identified by 'novo12345';  -- Dando total liberdade em todos os bancos (*.*)

# Privilegio, Nivel Banco de Dados - Liberdade em apenas um banco de dados:
grant all on cadastro.* to novoUsuario@localhost identified by 'novo12345';  -- Dando liberdade em apenas um banco (cadastro.*)

grant execute on procedure comercial.nomeprocedure to usermysql@localhost; -- Para procedures.

# Deletando um usuario:
delete from user where Host = 'localhost' and User = 'novoUsuario';

# Nível proxy user: o privilégio de proxy permite que um usuário seja proxy de outro. O usuário externo de um outro host assume os privi-légios de um usuário:
grant PROXY on usermysql@localhost to 'usuarioexterno'@'hostexterno';

# *********************************** OUTROS COMANDOS ************************************* #

# Comandos show:
SHOW DATABASES;
show columns from funcionario;
describe funcionario;
show full columns from funcionario;
show columns from funcionario where type like 'varchar%';
SHOW CREATE DATABASE cadastro;
SHOW CREATE TABLE tbl_name;
SHOW CREATE FUNCTION func_name;
SHOW CREATE PROCEDURE proc_name;
SHOW CREATE VIEW view_name;
show grants for root@localhost;
SHOW PRIVILEGES;
SHOW SLAVE HOSTS;
SHOW CREATE TRIGGER trigger_name;

# Listando todas as conexões ativas no mysql:
show processlist;

# "Matando" conexões ativas:
-- Obs, primeiramente, anote o id da conexão para utilizar.
kill numero_do_id;

# Exportando consultas em arquivos:
select * from funcionario
into outfile '/home/consulta.txt'
fields terminated by ','
enclosed by '''';
-- ou
select * from funcionario INTO OUTFILE '/home/arquivo.txt';

# Importando um arquivo de uma determinada tabela e populando:
load data infile 'c:/import_user.txt' -- Arquivo
into table comuser -- Tabela no qual será inserido os registros
fields terminated by ',' -- Obs: Não esqueça de colocar as aspas e caracter da mesma forma que, quando exportou.
enclosed by '''';

# Descobrindo a qual tabela pertence determinada coluna... Perfeito se caso estiver perdido a qual tabela pertence a coluna:
select table_schema Banco_Dados,
table_name tabela,
column_name nome_coluna
from information_schema.columns
where table_schema = 'cadastro'
and column_name = 'Area';

-- mysqlshow -u root -p; -- Apenas no terminal para exibir os bancos que esse administrador pode utilizar.
-- mysqlshow -u root -p cadastro -- Apenas no terminal para exibir as colunas do banco de dados que esse administrador pode utilizar.
-- mysqlshow -u root -p cadastro funcionario % -- Apenas pelo terminal e dessa vez o banco e a tabela.

# Para fazer backup pelo terminal do Ubuntu:

-- 1º navegue até a basta onde se encontra o mysqdump;
-- 2º utilize o seguinte comando para realizar o backup com toda a estrutura e dados inseridos:
-- mysqldump -u root -p nomeDoBanco > diretorioOndeSeráSalvo/backupDoBanco.sql
-- exemplo: mysqldump -u root -p comercial > /home/hugo/backupComercial.sql

# Para fazer backup com todas as function, procedure e trigger:
-- 1º Faça os mesmos passos anteriores e navegue até a pasta onde encontra-se o mysqldump;
-- 2º Utilize o seguinte comando: mysqldump -u root -p --routines --triggers comercial > /home/hugo/backupComercial.sql

# Para fazer backup apenas da tabela:
-- 1º Utilize o seguinte comando: mysqldump -u root -p comercial conclien> /home/hugo/backupComercial.sql

# Para fazer o backup de todos os bancos de dados:
-- 1º Utilize o seguinte comando: mysqldump -u root -p --all-databases > /home/hugo/backupComercial.sql

# Importante backup:
-- 1º Utilize o comando: mysql -h localhost -u root -p -d nomeDoBanco < /home/hugo/backupComercial.sql


