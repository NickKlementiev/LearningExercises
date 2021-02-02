-- Criação do BD

create database LPBD_RH;

use LPBD_RH;

-- Criação das tabelas

CREATE TABLE regioes
    ( 
	  regiao_id          integer not null, 
      regiao_nome        varchar(25), 
      PRIMARY KEY (regiao_id) 
	);

CREATE TABLE paises 
    ( 
	  pais_id            CHAR(2) not null, 
      pais_nome          varchar(40), 
      regiao_id          integer, 
      PRIMARY KEY (pais_id) 
    ); 

CREATE TABLE locais
    ( 
	  local_id           integer not null,
      endereco           varchar(40),
      cep                varchar(12),
      cidade             varchar(30),
      estado             varchar(25),
      pais_id            CHAR(2),
      PRIMARY KEY (local_id) 
	);

CREATE TABLE departamentos
    ( 
	  departamento_id    integer not null,
      departamento_nome  varchar(30),
      gerente_id         integer,
      local_id           integer,
      PRIMARY KEY (departamento_id) 
	);
	
CREATE TABLE funcionarios
    ( 
	  funcionario_id     integer not null,
      pre_nome           varchar(20),
      sobre_nome         varchar(25),
      email              varchar(25),
      fone               varchar(20),
      dt_admiss          DATE,
      cargo              varchar(10),
      salario            float,
      pc_comiss          float,
      gerente_id         integer,
      departamento_id    integer,
      PRIMARY KEY (funcionario_id) 
	);

CREATE TABLE cargos
    ( cargo_id          varchar(10) not null,
      cargo_desc        varchar(35),
      min_salario       float,
      max_salario       float,
      PRIMARY KEY (cargo_id) 
	);

-- Carga das tabelas

INSERT INTO regioes VALUES 
        ( 1
        , 'Europa' 
        );

INSERT INTO regioes VALUES 
        ( 2
        , 'Americas' 
        );

INSERT INTO regioes VALUES 
        ( 3
        , 'Asia' 
        );

INSERT INTO regioes VALUES 
        ( 4
        , 'Africa' 
        );


INSERT INTO paises VALUES 
        ( 'IT'
        , 'Italia'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'JP'
        , 'Japao'
     	, 3 
        );

INSERT INTO paises VALUES 
        ( 'US'
        , 'Estados Unidos'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'CA'
        , 'Canada'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'CN'
        , 'China'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'IN'
        , 'India'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'AU'
        , 'Australia'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'ZW'
        , 'Zimbabwe'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'SG'
        , 'Singapura'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'UK'
        , 'Reino Unido'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'FR'
        , 'Franca'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'DE'
        , 'Alemanha'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'ZM'
        , 'Zambia'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'EG'
        , 'Egito'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'BR'
        , 'Brasil'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'CH'
        , 'Suica'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'NL'
        , 'holanda'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'MX'
        , 'Mexico'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'KW'
        , 'Kuwait'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'IL'
        , 'Israel'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'DK'
        , 'Dinamarca'
        , 1 
        );

INSERT INTO paises VALUES 
        ( 'HK'
        , 'HongKong'
        , 3 
        );

INSERT INTO paises VALUES 
        ( 'NG'
        , 'Nigeria'
        , 4 
        );

INSERT INTO paises VALUES 
        ( 'AR'
        , 'Argentina'
        , 2 
        );

INSERT INTO paises VALUES 
        ( 'BE'
        , 'Belgica'
        , 1 
        );


INSERT INTO locais VALUES 
        ( 1000 
        , '1297 Via Cola di Rie'
        , '00989'
        , 'Roma'
        , NULL
        , 'IT'
        );

INSERT INTO locais VALUES 
        ( 1100 
        , '93091 Calle della Testa'
        , '10934'
        , 'Venice'
        , NULL
        , 'IT'
        );

INSERT INTO locais VALUES 
        ( 1200 
        , '2017 Shinjuku-ku'
        , '1689'
        , 'Tokyo'
        , 'Tokyo Prefecture'
        , 'JP'
        );

INSERT INTO locais VALUES 
        ( 1300 
        , '9450 Kamiya-cho'
        , '6823'
        , 'Hiroshima'
        , NULL
        , 'JP'
        );

INSERT INTO locais VALUES 
        ( 1400 
        , '2014 Jabberwocky Rd'
        , '26192'
        , 'Southlake'
        , 'Texas'
        , 'US'
        );

INSERT INTO locais VALUES 
        ( 1500 
        , '2011 Interiors Blvd'
        , '99236'
        , 'South San Francisco'
        , 'California'
        , 'US'
        );

INSERT INTO locais VALUES 
        ( 1600 
        , '2007 Zagora St'
        , '50090'
        , 'South Brunswick'
        , 'New Jersey'
        , 'US'
        );

INSERT INTO locais VALUES 
        ( 1700 
        , '2004 Charade Rd'
        , '98199'
        , 'Seattle'
        , 'Washington'
        , 'US'
        );

INSERT INTO locais VALUES 
        ( 1800 
        , '147 Spadina Ave'
        , 'M5V 2L7'
        , 'Toronto'
        , 'Ontario'
        , 'CA'
        );

INSERT INTO locais VALUES 
        ( 1900 
        , '6092 Boxwood St'
        , 'YSW 9T2'
        , 'Whitehorse'
        , 'Yukon'
        , 'CA'
        );

INSERT INTO locais VALUES 
        ( 2000 
        , '40-5-12 Laogianggen'
        , '190518'
        , 'Beijing'
        , NULL
        , 'CN'
        );

INSERT INTO locais VALUES 
        ( 2100 
        , '1298 Vileparle (E)'
        , '490231'
        , 'Bombay'
        , 'Maharashtra'
        , 'IN'
        );

INSERT INTO locais VALUES 
        ( 2200 
        , '12-98 Victoria Street'
        , '2901'
        , 'Sydney'
        , 'New South Wales'
        , 'AU'
        );

INSERT INTO locais VALUES 
        ( 2300 
        , '198 Clementi North'
        , '540198'
        , 'Singapore'
        , NULL
        , 'SG'
        );

INSERT INTO locais VALUES 
        ( 2400 
        , '8204 Arthur St'
        , NULL
        , 'London'
        , NULL
        , 'UK'
        );

INSERT INTO locais VALUES 
        ( 2500 
        , 'Magdalen Centre, The Oxford Science Park'
        , 'OX9 9ZB'
        , 'Oxford'
        , 'Oxford'
        , 'UK'
        );

INSERT INTO locais VALUES 
        ( 2600 
        , '9702 Chester Road'
        , '09629850293'
        , 'Stretford'
        , 'Manchester'
        , 'UK'
        );

INSERT INTO locais VALUES 
        ( 2700 
        , 'Schwanthalerstr. 7031'
        , '80925'
        , 'Munich'
        , 'Bavaria'
        , 'DE'
        );

INSERT INTO locais VALUES 
        ( 2800 
        , 'Rua Frei Caneca 1360 '
        , '01307-002'
        , 'Sao Paulo'
        , 'Sao Paulo'
        , 'BR'
        );

INSERT INTO locais VALUES 
        ( 2900 
        , '20 Rue des Corps-Saints'
        , '1730'
        , 'Geneva'
        , 'Geneve'
        , 'CH'
        );

INSERT INTO locais VALUES 
        ( 3000 
        , 'Murtenstrasse 921'
        , '3095'
        , 'Bern'
        , 'BE'
        , 'CH'
        );

INSERT INTO locais VALUES 
        ( 3100 
        , 'Pieter Breughelstraat 837'
        , '3029SK'
        , 'Utrecht'
        , 'Utrecht'
        , 'NL'
        );

INSERT INTO locais VALUES 
        ( 3200 
        , 'Mariano Escobedo 9991'
        , '11932'
        , 'Mexico City'
        , 'Distrito Federal,'
        , 'MX'
        );


INSERT INTO departamentos VALUES 
        ( 10
        , 'Administrativo'
        , 200
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 20
        , 'Marketing'
        , 201
        , 1800
        );
                                
INSERT INTO departamentos VALUES 
        ( 30
        , 'Compras'
        , 114
        , 1700
	);
                
INSERT INTO departamentos VALUES 
        ( 40
        , 'Recursos Humanos'
        , 203
        , 2400
        );

INSERT INTO departamentos VALUES 
        ( 50
        , 'Expedicao'
        , 121
        , 1500
        );
                
INSERT INTO departamentos VALUES 
        ( 60 
        , 'TI'
        , 103
        , 1400
        );
                
INSERT INTO departamentos VALUES 
        ( 70 
        , 'Relacoes Publicas'
        , 204
        , 2700
        );
                
INSERT INTO departamentos VALUES 
        ( 80 
        , 'Vendas'
        , 145
        , 2500
        );
                
INSERT INTO departamentos VALUES 
        ( 90 
        , 'Executivo'
        , 100
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 100 
        , 'Financeiro'
        , 108
        , 1700
        );
                
INSERT INTO departamentos VALUES 
        ( 110 
        , 'Contabilidade'
        , 205
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 120 
        , 'Tesouraria'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 140 
        , 'Credito'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 160 
        , 'Beneficios'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 170 
        , 'Manufatura'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 180 
        , 'Construcao'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 190 
        , 'Contratacao'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 200 
        , 'Operacoes'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 210 
        , 'Suporte TI'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 230 
        , 'Helpdesk'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 240 
        , 'Vendas Governo'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 260 
        , 'Recrutamento'
        , NULL
        , 1700
        );

INSERT INTO departamentos VALUES 
        ( 270 
        , 'Folha de Pagamento'
        , NULL
        , 1700
        );


INSERT INTO cargos VALUES 
        ( 'PRES'
        , 'Presidente'
        , 20000
        , 40000
        );

INSERT INTO cargos VALUES 
        ( 'VP_AD'
        , 'Vice Presidente administrativo'
        , 15000
        , 30000
        );

INSERT INTO cargos VALUES 
        ( 'ASS_AD'
        , 'Assistente Administrativo'
        , 3000
        , 6000
        );

INSERT INTO cargos VALUES 
        ( 'GER_FIN'
        , 'Gerente Financeiro'
        , 8200
        , 16000
        );

INSERT INTO cargos VALUES 
        ( 'CONTAD'
        , 'Contador'
        , 4200
        , 9000
        );

INSERT INTO cargos VALUES 
        ( 'GER_CTB'
        , 'Gerente Contabil'
        , 8200
        , 16000
        );

INSERT INTO cargos VALUES 
        ( 'GER_VDS'
        , 'Gerente Vendas'
        , 10000
        , 20000
        );

INSERT INTO cargos VALUES 
        ( 'vendas'
        , 'Vendedor'
        , 6000
        , 12000
        );

INSERT INTO cargos VALUES 
        ( 'GER_COM'
        , 'Gerente Compras'
        , 8000
        , 15000
        );

INSERT INTO cargos VALUES 
        ( 'Compras'
        , 'Comprador'
        , 2500
        , 5500
        );

INSERT INTO cargos VALUES 
        ( 'Estoque'
        , 'Estoquista'
        , 2000
        , 5000
        );

INSERT INTO cargos VALUES 
        ( 'EXP'
        , 'Expedidor'
        , 2500
        , 5500
        );

INSERT INTO cargos VALUES 
        ( 'TI_PROG'
        , 'Programador'
        , 4000
        , 10000
        );

INSERT INTO cargos VALUES 
        ( 'GER_MK'
        , 'Gerente Marketing'
        , 9000
        , 15000
        );

INSERT INTO cargos VALUES 
        ( 'MK_REP'
        , 'Marketing'
        , 4000
        , 9000
        );

INSERT INTO cargos VALUES 
        ( 'RH_REP'
        , 'Recursos Humanos'
        , 4000
        , 9000
        );

INSERT INTO cargos VALUES 
        ( 'RP_REP'
        , 'Representante Relacoes Publicas'
        , 4500
        , 10500
        );


INSERT INTO funcionarios VALUES 
        ( 100
        , 'Steven'
        , 'King'
        , 'SKING'
        , '515.123.4567'
        , '1987/06/17'
        , 'PRES'
        , 24000
        , NULL
        , NULL
        , 90
        );

INSERT INTO funcionarios VALUES 
        ( 101
        , 'Neena'
        , 'Kochhar'
        , 'NKOCHHAR'
        , '515.123.4568'
        , '1989/09/21'
        , 'VP_AD'
        , 17000
        , NULL
        , 100
        , 90
        );

INSERT INTO funcionarios VALUES 
        ( 102
        , 'Lex'
        , 'De Haan'
        , 'LDEHAAN'
        , '515.123.4569'
        , '1993/01/13'
        , 'VP_AD'
        , 17000
        , NULL
        , 100
        , 90
        );

INSERT INTO funcionarios VALUES 
        ( 103
        , 'Alexander'
        , 'Hunold'
        , 'AHUNOLD'
        , '590.423.4567'
        , '1990/01/03'
        , 'TI_PROG'
        , 9000
        , NULL
        , 102
        , 60
        );

INSERT INTO funcionarios VALUES 
        ( 104
        , 'Bruce'
        , 'Ernst'
        , 'BERNST'
        , '590.423.4568'
        , '1991/05/21'
        , 'TI_PROG'
        , 6000
        , NULL
        , 103
        , 60
        );

INSERT INTO funcionarios VALUES 
        ( 105
        , 'David'
        , 'Austin'
        , 'DAUSTIN'
        , '590.423.4569'
        , '1997/06/25'
        , 'TI_PROG'
        , 4800
        , NULL
        , 103
        , 60
        );

INSERT INTO funcionarios VALUES 
        ( 106
        , 'Valli'
        , 'Pataballa'
        , 'VPATABAL'
        , '590.423.4560'
        , '1998/02/05'
        , 'TI_PROG'
        , 4800
        , NULL
        , 103
        , 60
        );

INSERT INTO funcionarios VALUES 
        ( 107
        , 'Diana'
        , 'Lorentz'
        , 'DLORENTZ'
        , '590.423.5567'
        , '1999/02/07'
        , 'TI_PROG'
        , 4200
        , NULL
        , 103
        , 60
        );

INSERT INTO funcionarios VALUES 
        ( 108
        , 'Nancy'
        , 'Greenberg'
        , 'NGREENBE'
        , '515.124.4569'
        , '1994/08/17'
        , 'GER_FIN'
        , 12000
        , NULL
        , 101
        , 100
        );

INSERT INTO funcionarios VALUES 
        ( 109
        , 'Daniel'
        , 'Faviet'
        , 'DFAVIET'
        , '515.124.4169'
        , '1994/08/16'
        , 'CONTAD'
        , 9000
        , NULL
        , 108
        , 100
        );

INSERT INTO funcionarios VALUES 
        ( 110
        , 'John'
        , 'Chen'
        , 'JCHEN'
        , '515.124.4269'
        , '1997/09/28'
        , 'CONTAD'
        , 8200
        , NULL
        , 108
        , 100
        );

INSERT INTO funcionarios VALUES 
        ( 111
        , 'Ismael'
        , 'Sciarra'
        , 'ISCIARRA'
        , '515.124.4369'
        , '1997/09/30'
        , 'CONTAD'
        , 7700
        , NULL
        , 108
        , 100
        );

INSERT INTO funcionarios VALUES 
        ( 112
        , 'Jose Manuel'
        , 'Urman'
        , 'JMURMAN'
        , '515.124.4469'
        , '1998/03/07'
        , 'CONTAD'
        , 7800
        , NULL
        , 108
        , 100
        );

INSERT INTO funcionarios VALUES 
        ( 113
        , 'Luis'
        , 'Popp'
        , 'LPOPP'
        , '515.124.4567'
        , '1999/12/07'
        , 'CONTAD'
        , 6900
        , NULL
        , 108
        , 100
        );

INSERT INTO funcionarios VALUES 
        ( 114
        , 'Den'
        , 'Raphaely'
        , 'DRAPHEAL'
        , '515.127.4561'
        , '1994/12/07'
        , 'GER_COM'
        , 11000
        , NULL
        , 100
        , 30
        );

INSERT INTO funcionarios VALUES 
        ( 115
        , 'Alexander'
        , 'Khoo'
        , 'AKHOO'
        , '515.127.4562'
        , '1995/05/18'
        , 'GER_FIN'
        , 3100
        , NULL
        , 114
        , 30
        );

INSERT INTO funcionarios VALUES 
        ( 116
        , 'Shelli'
        , 'Baida'
        , 'SBAIDA'
        , '515.127.4563'
        , '1997/12/24'
        , 'VENDAS'
        , 2900
        , NULL
        , 114
        , 30
        );

INSERT INTO funcionarios VALUES 
        ( 117
        , 'Sigal'
        , 'Tobias'
        , 'STOBIAS'
        , '515.127.4564'
        , '1997/07/24'
        , 'VENDAS'
        , 2800
        , NULL
        , 114
        , 30
        );

INSERT INTO funcionarios VALUES 
        ( 118
        , 'Guy'
        , 'Himuro'
        , 'GHIMURO'
        , '515.127.4565'
        , '1998/11/15'
        , 'VENDAS'
        , 2600
        , NULL
        , 114
        , 30
        );

INSERT INTO funcionarios VALUES 
        ( 119
        , 'Karen'
        , 'Colmenares'
        , 'KCOLMENA'
        , '515.127.4566'
        , '1999/08/10'
        , 'VENDAS'
        , 2500
        , NULL
        , 114
        , 30
        );

INSERT INTO funcionarios VALUES 
        ( 120
        , 'Matthew'
        , 'Weiss'
        , 'MWEISS'
        , '650.123.1234'
        , '1996/07/18'
        , 'ESTOQUE'
        , 8000
        , NULL
        , 100
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 121
        , 'Adam'
        , 'Fripp'
        , 'AFRIPP'
        , '650.123.2234'
        , '1997/04/10'
        , 'ESTOQUE'
        , 8200
        , NULL
        , 100
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 122
        , 'Payam'
        , 'Kaufling'
        , 'PKAUFLIN'
        , '650.123.3234'
        , '1995/05/01'
        , 'ESTOQUE'
        , 7900
        , NULL
        , 100
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 123
        , 'Shanta'
        , 'Vollman'
        , 'SVOLLMAN'
        , '650.123.4234'
        , '1997/10/10'
        , 'ESTOQUE'
        , 6500
        , NULL
        , 100
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 124
        , 'Kevin'
        , 'Mourgos'
        , 'KMOURGOS'
        , '650.123.5234'
        , '1999/11/16'
        , 'ESTOQUE'
        , 5800
        , NULL
        , 100
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 125
        , 'Julia'
        , 'Nayer'
        , 'JNAYER'
        , '650.124.1214'
        , '1997/07/16'
        , 'ESTOQUE'
        , 3200
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 126
        , 'Irene'
        , 'Mikkilineni'
        , 'IMIKKILI'
        , '650.124.1224'
        , '1998/09/28'
        , 'ESTOQUE'
        , 2700
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 127
        , 'James'
        , 'Landry'
        , 'JLANDRY'
        , '650.124.1334'
        , '1999/01/14'
        , 'ESTOQUE'
        , 2400
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 128
        , 'Steven'
        , 'Markle'
        , 'SMARKLE'
        , '650.124.1434'
        , '2000/03/08'
        , 'ESTOQUE'
        , 2200
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 129
        , 'Laura'
        , 'Bissot'
        , 'LBISSOT'
        , '650.124.5234'
        , '1997/08/20'
        , 'ESTOQUE'
        , 3300
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 130
        , 'Mozhe'
        , 'Atkinson'
        , 'MATKINSO'
        , '650.124.6234'
        , '1997/10/30'
        , 'ESTOQUE'
        , 2800
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 131
        , 'James'
        , 'Marlow'
        , 'JAMRLOW'
        , '650.124.7234'
        , '1997/02/16'
        , 'ESTOQUE'
        , 2500
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 132
        , 'TJ'
        , 'Olson'
        , 'TJOLSON'
        , '650.124.8234'
        , '1999/04/10'
        , 'ESTOQUE'
        , 2100
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 133
        , 'Jason'
        , 'Mallin'
        , 'JMALLIN'
        , '650.127.1934'
        , '1996/06/14'
        , 'ESTOQUE'
        , 3300
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 134
        , 'Michael'
        , 'Rogers'
        , 'MROGERS'
        , '650.127.1834'
        , '1998/08/26'
        , 'ESTOQUE'
        , 2900
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 135
        , 'Ki'
        , 'Gee'
        , 'KGEE'
        , '650.127.1734'
        , '1999/12/12'
        , 'ESTOQUE'
        , 2400
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 136
        , 'Hazel'
        , 'Philtanker'
        , 'HPHILTAN'
        , '650.127.1634'
        , '2000/02/06'
        , 'ESTOQUE'
        , 2200
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 137
        , 'Renske'
        , 'Ladwig'
        , 'RLADWIG'
        , '650.121.1234'
        , '1995/07/14'
        , 'ESTOQUE'
        , 3600
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 138
        , 'Stephen'
        , 'Stiles'
        , 'SSTILES'
        , '650.121.2034'
        , '1997/10/26'
        , 'ESTOQUE'
        , 3200
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 139
        , 'John'
        , 'Seo'
        , 'JSEO'
        , '650.121.2019'
        , '1998/02/12'
        , 'ESTOQUE'
        , 2700
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 140
        , 'Joshua'
        , 'Patel'
        , 'JPATEL'
        , '650.121.1834'
        , '1998/04/06'
        , 'ESTOQUE'
        , 2500
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 141
        , 'Trenna'
        , 'Rajs'
        , 'TRAJS'
        , '650.121.8009'
        , '1995/10/17'
        , 'ESTOQUE'
        , 3500
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 142
        , 'Curtis'
        , 'Davies'
        , 'CDAVIES'
        , '650.121.2994'
        , '1997/01/29'
        , 'ESTOQUE'
        , 3100
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 143
        , 'Randall'
        , 'Matos'
        , 'RMATOS'
        , '650.121.2874'
        , '1998/03/15'
        , 'ESTOQUE'
        , 2600
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 144
        , 'Peter'
        , 'Vargas'
        , 'PVARGAS'
        , '650.121.2004'
        , '1998/07/09'
        , 'ESTOQUE'
        , 2500
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 145
        , 'John'
        , 'Russell'
        , 'JRUSSEL'
        , '011.44.1344.429268'
        , '1996/10/01'
        , 'GER_VDS'
        , 14000
        , .4
        , 100
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 146
        , 'Karen'
        , 'Partners'
        , 'KPARTNER'
        , '011.44.1344.467268'
        , '1997/01/05'
        , 'GER_VDS'
        , 13500
        , .3
        , 100
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 147
        , 'Alberto'
        , 'Errazuriz'
        , 'AERRAZUR'
        , '011.44.1344.429278'
        , '1997/03/10'
        , 'GER_VDS'
        , 12000
        , .3
        , 100
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 148
        , 'Gerald'
        , 'Cambrault'
        , 'GCAMBRAU'
        , '011.44.1344.619268'
        , '1999/10/15'
        , 'GER_VDS'
        , 11000
        , .3
        , 100
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 149
        , 'Eleni'
        , 'Zlotkey'
        , 'EZLOTKEY'
        , '011.44.1344.429018'
        , '2000/01/29'
        , 'GER_VDS'
        , 10500
        , .2
        , 100
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 150
        , 'Peter'
        , 'Tucker'
        , 'PTUCKER'
        , '011.44.1344.129268'
        , '1997/01/30'
        , 'VENDAS'
        , 10000
        , .3
        , 145
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 151
        , 'David'
        , 'Bernstein'
        , 'DBERNSTE'
        , '011.44.1344.345268'
        , '1997/03/24'
        , 'VENDAS'
        , 9500
        , .25
        , 145
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 152
        , 'Peter'
        , 'Hall'
        , 'PHALL'
        , '011.44.1344.478968'
        , '1997/08/20'
        , 'VENDAS'
        , 9000
        , .25
        , 145
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 153
        , 'Christopher'
        , 'Olsen'
        , 'COLSEN'
        , '011.44.1344.498718'
        , '1998/03/30'
        , 'VENDAS'
        , 8000
        , .2
        , 145
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 154
        , 'Nanette'
        , 'Cambrault'
        , 'NCAMBRAU'
        , '011.44.1344.987668'
        , '1998/12/09'
        , 'VENDAS'
        , 7500
        , .2
        , 145
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 155
        , 'Oliver'
        , 'Tuvault'
        , 'OTUVAULT'
        , '011.44.1344.486508'
        , '1999/11/23'
        , 'VENDAS'
        , 7000
        , .15
        , 145
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 156
        , 'Janette'
        , 'King'
        , 'JKING'
        , '011.44.1345.429268'
        , '1996/01/30'
        , 'VENDAS'
        , 10000
        , .35
        , 146
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 157
        , 'Patrick'
        , 'Sully'
        , 'PSULLY'
        , '011.44.1345.929268'
        , '1996/03/04'
        , 'VENDAS'
        , 9500
        , .35
        , 146
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 158
        , 'Allan'
        , 'McEwen'
        , 'AMCEWEN'
        , '011.44.1345.829268'
        , '1996/08/01'
        , 'VENDAS'
        , 9000
        , .35
        , 146
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 159
        , 'Lindsey'
        , 'Smith'
        , 'LSMITH'
        , '011.44.1345.729268'
        , '1997/03/10'
        , 'VENDAS'
        , 8000
        , .3
        , 146
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 160
        , 'Louise'
        , 'Doran'
        , 'LDORAN'
        , '011.44.1345.629268'
        , '1997/12/15'
        , 'VENDAS'
        , 7500
        , .3
        , 146
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 161
        , 'Sarath'
        , 'Sewall'
        , 'SSEWALL'
        , '011.44.1345.529268'
        , '1998/11/03'
        , 'VENDAS'
        , 7000
        , .25
        , 146
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 162
        , 'Clara'
        , 'Vishney'
        , 'CVISHNEY'
        , '011.44.1346.129268'
        , '1997/11/11'
        , 'VENDAS'
        , 10500
        , .25
        , 147
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 163
        , 'Danielle'
        , 'Greene'
        , 'DGREENE'
        , '011.44.1346.229268'
        , '1999/03/19'
        , 'VENDAS'
        , 9500
        , .15
        , 147
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 164
        , 'MatteW'
        , 'Marvins'
        , 'MMARVINS'
        , '011.44.1346.329268'
        , '2000/01/24'
        , 'VENDAS'
        , 7200
        , .10
        , 147
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 165
        , 'David'
        , 'Lee'
        , 'DLEE'
        , '011.44.1346.529268'
        , '2000/02/23'
        , 'VENDAS'
        , 6800
        , .1
        , 147
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 166
        , 'Sundar'
        , 'Ande'
        , 'SANDE'
        , '011.44.1346.629268'
        , '2000/03/24'
        , 'VENDAS'
        , 6400
        , .10
        , 147
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 167
        , 'Amit'
        , 'Banda'
        , 'ABANDA'
        , '011.44.1346.729268'
        , '2000/04/21'
        , 'VENDAS'
        , 6200
        , .10
        , 147
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 168
        , 'Lisa'
        , 'Ozer'
        , 'LOZER'
        , '011.44.1343.929268'
        , '1997/03/11'
        , 'VENDAS'
        , 11500
        , .25
        , 148
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 169  
        , 'Harrison'
        , 'Bloom'
        , 'HBLOOM'
        , '011.44.1343.829268'
        , '1998/03/23'
        , 'VENDAS'
        , 10000
        , .20
        , 148
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 170
        , 'Tayler'
        , 'Fox'
        , 'TFOX'
        , '011.44.1343.729268'
        , '1998/01/24'
        , 'VENDAS'
        , 9600
        , .20
        , 148
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 171
        , 'William'
        , 'Smith'
        , 'WSMITH'
        , '011.44.1343.629268'
        , '1999/02/23'
        , 'VENDAS'
        , 7400
        , .15
        , 148
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 172
        , 'Elizabeth'
        , 'Bates'
        , 'EBATES'
        , '011.44.1343.529268'
        , '1999/03/24'
        , 'VENDAS'
        , 7300
        , .15
        , 148
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 173
        , 'Sundita'
        , 'Kumar'
        , 'SKUMAR'
        , '011.44.1343.329268'
        , '2000/04/21'
        , 'VENDAS'
        , 6100
        , .10
        , 148
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 174
        , 'Ellen'
        , 'Abel'
        , 'EABEL'
        , '011.44.1644.429267'
        , '1996/05/11'
        , 'VENDAS'
        , 11000
        , .30
        , 149
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 175
        , 'Alyssa'
        , 'Hutton'
        , 'AHUTTON'
        , '011.44.1644.429266'
        , '1997/03/19'
        , 'VENDAS'
        , 8800
        , .25
        , 149
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 176
        , 'Jonathon'
        , 'Taylor'
        , 'JTAYLOR'
        , '011.44.1644.429265'
        , '1998/03/24'
        , 'VENDAS'
        , 8600
        , .20
        , 149
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 177
        , 'Jack'
        , 'Livingston'
        , 'JLIVINGS'
        , '011.44.1644.429264'
        , '1998/04/23'
        , 'VENDAS'
        , 8400
        , .20
        , 149
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 178
        , 'Kimberly'
        , 'Grant'
        , 'KGRANT'
        , '011.44.1644.429263'
        , '1999/05/24'
        , 'VENDAS'
        , 7000
        , .15
        , 149
        , NULL
        );

INSERT INTO funcionarios VALUES 
        ( 179
        , 'Charles'
        , 'Johnson'
        , 'CJOHNSON'
        , '011.44.1644.429262'
        , '2000/01/04'
        , 'VENDAS'
        , 6200
        , .10
        , 149
        , 80
        );

INSERT INTO funcionarios VALUES 
        ( 180
        , 'Winston'
        , 'Taylor'
        , 'WTAYLOR'
        , '650.507.9876'
        , '1998/01/24'
        , 'EXP'
        , 3200
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 181
        , 'Jean'
        , 'Fleaur'
        , 'JFLEAUR'
        , '650.507.9877'
        , '1998/02/23'
        , 'EXP'
        , 3100
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 182
        , 'Martha'
        , 'Sullivan'
        , 'MSULLIVA'
        , '650.507.9878'
        , '1999/06/21'
        , 'EXP'
        , 2500
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 183
        , 'Girard'
        , 'Geoni'
        , 'GGEONI'
        , '650.507.9879'
        , '2000/02/03'
        , 'EXP'
        , 2800
        , NULL
        , 120
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 184
        , 'Nandita'
        , 'Sarchand'
        , 'NSARCHAN'
        , '650.509.1876'
        , '1996/01/27'
        , 'EXP'
        , 4200
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 185
        , 'Alexis'
        , 'Bull'
        , 'ABULL'
        , '650.509.2876'
        , '1997/02/20'
        , 'EXP'
        , 4100
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 186
        , 'Julia'
        , 'Dellinger'
        , 'JDELLING'
        , '650.509.3876'
        , '1998/06/24'
        , 'EXP'
        , 3400
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 187
        , 'Anthony'
        , 'Cabrio'
        , 'ACABRIO'
        , '650.509.4876'
        , '1999/02/07'
        , 'EXP'
        , 3000
        , NULL
        , 121
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 188
        , 'Kelly'
        , 'Chung'
        , 'KCHUNG'
        , '650.505.1876'
        , '1997/06/14'        
        , 'EXP'
        , 3800
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 189
        , 'Jennifer'
        , 'Dilly'
        , 'JDILLY'
        , '650.505.2876'
        , '1997/08/13'
        , 'EXP'
        , 3600
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 190
        , 'Timothy'
        , 'Gates'
        , 'TGATES'
        , '650.505.3876'
        , '1998/07/11'
        , 'EXP'
        , 2900
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 191
        , 'Randall'
        , 'Perkins'
        , 'RPERKINS'
        , '650.505.4876'
        , '1999/12/19'
        , 'EXP'
        , 2500
        , NULL
        , 122
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 192
        , 'Sarah'
        , 'Bell'
        , 'SBELL'
        , '650.501.1876'
        , '1996/02/04'
        , 'EXP'
        , 4000
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 193
        , 'Britney'
        , 'Everett'
        , 'BEVERETT'
        , '650.501.2876'
        , '1997/03/03'
        , 'EXP'
        , 3900
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 194
        , 'Samuel'
        , 'McCain'
        , 'SMCCAIN'
        , '650.501.3876'
        , '1998/07/01'
        , 'EXP'
        , 3200
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 195
        , 'Vance'
        , 'Jones'
        , 'VJONES'
        , '650.501.4876'
        , '1999/03/17'
        , 'EXP'
        , 2800
        , NULL
        , 123
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 196
        , 'Alana'
        , 'Walsh'
        , 'AWALSH'
        , '650.507.9811'
        , '1998/04/24'
        , 'EXP'
        , 3100
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 197
        , 'Kevin'
        , 'Feeney'
        , 'KFEENEY'
        , '650.507.9822'
        , '1998/05/23'
        , 'EXP'
        , 3000
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 198
        , 'Donald'
        , 'OConnell'
        , 'DOCONNEL'
        , '650.507.9833'
        , '1999/06/21'
        , 'EXP'
        , 2600
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 199
        , 'Douglas'
        , 'Grant'
        , 'DGRANT'
        , '650.507.9844'
        , '2000/01/13'
        , 'EXP'
        , 2600
        , NULL
        , 124
        , 50
        );

INSERT INTO funcionarios VALUES 
        ( 200
        , 'Jennifer'
        , 'Whalen'
        , 'JWHALEN'
        , '515.123.4444'
        , '1987/09/17'
        , 'ASS_AD'
        , 4400
        , NULL
        , 101
        , 10
        );

INSERT INTO funcionarios VALUES 
        ( 201
        , 'Michael'
        , 'Hartstein'
        , 'MHARTSTE'
        , '515.123.5555'
        , '1996/02/17'
        , 'GER_MK'
        , 13000
        , NULL
        , 100
        , 20
        );

INSERT INTO funcionarios VALUES 
        ( 202
        , 'Pat'
        , 'Fay'
        , 'PFAY'
        , '603.123.6666'
        , '1997/08/17'
        , 'MK_REP'
        , 6000
        , NULL
        , 201
        , 20
        );

INSERT INTO funcionarios VALUES 
        ( 203
        , 'Susan'
        , 'Mavris'
        , 'SMAVRIS'
        , '515.123.7777'
        , '1994/06/07'
        , 'RH_REP'
        , 6500
        , NULL
        , 101
        , 40
        );

INSERT INTO funcionarios VALUES 
        ( 204
        , 'Hermann'
        , 'Baer'
        , 'HBAER'
        , '515.123.8888'
        , '1994/06/07'
        , 'RP_REP'
        , 10000
        , NULL
        , 101
        , 70
        );

INSERT INTO funcionarios VALUES 
        ( 205
        , 'Shelley'
        , 'Higgins'
        , 'SHIGGINS'
        , '515.123.8080'
        , '1994/06/07'
        , 'GER_CTB'
        , 12000
        , NULL
        , 101
        , 110
        );

INSERT INTO funcionarios VALUES 
        ( 206
        , 'William'
        , 'Gietz'
        , 'WGIETZ'
        , '515.123.8181'
        , '1994/06/07'
        , 'CONTADOR'
        , 8300
        , NULL
        , 205
        , 110
        );
-- A
SELECT sobre_nome, fone, dt_admiss, cargo FROM funcionarios;
-- B
SELECT sobre_nome FROM funcionarios WHERE salario > 12000;
-- C
SELECT sobre_nome, departamento_id FROM funcionarios WHERE funcionario_id = 176;
-- D
SELECT sobre_nome, salario FROM funcionarios WHERE salario BETWEEN 5000 AND 12000 AND departamento_id = 20;
-- E
SELECT funcionario_id, sobre_nome, salario, salario * 1.327 AS "Aumento" FROM funcionarios;
-- F
SELECT sobre_nome, pre_nome, cargo, dt_admiss FROM funcionarios WHERE sobre_nome IN ("Matos", "Taylor")
ORDER BY dt_admiss;
-- G
SELECT sobre_nome, departamento_id FROM funcionarios WHERE departamento_id IN (20, 50) AND salario > 2500;
-- H
SELECT sobre_nome, cargo FROM funcionarios WHERE pc_comiss IS NULL;
-- I
SELECT sobre_nome FROM funcionarios WHERE sobre_nome LIKE "K%";
-- J
SELECT sobre_nome, salario FROM funcionarios WHERE cargo LIKE "%VDS";
-- K
SELECT sobre_nome, dt_admiss FROM funcionarios WHERE dt_admiss LIKE "1997%";
-- L
SELECT sobre_nome, salario, dt_admiss FROM funcionarios WHERE dt_admiss LIKE "1994-06%";
-- M
SELECT MAX(salario) AS "Máximo", MIN(salario) AS "Mínimo", SUM(salario) AS "Somatória", AVG(salario) AS "Média"
FROM funcionarios;

-- Exercícios de INNER JOIN e OUTER JOIN
-- A
SELECT F.sobre_nome, D.departamento_id, D.departamento_nome FROM funcionarios AS F
INNER JOIN departamentos AS D ON F.departamento_id = D.departamento_id;
-- B
SELECT F.funcionario_id, F.sobre_nome, C.cargo_id, C.cargo_desc FROM funcionarios AS F
INNER JOIN cargos AS C ON F.cargo = C.cargo_id
ORDER BY F.sobre_nome;
-- C
SELECT L.local_id, L.endereco, L.cidade, L.estado, P.pais_nome, R.regiao_nome FROM locais AS L
INNER JOIN paises as P ON L.pais_id = P.pais_id
INNER JOIN regioes as R ON P.regiao_id = R.regiao_id;
-- D
SELECT F.sobre_nome, F.salario, D.departamento_nome, C.cargo_desc FROM funcionarios AS F
INNER JOIN departamentos AS D ON F.departamento_id = D.departamento_id
INNER JOIN cargos AS C ON F.cargo = C.cargo_id;
-- E
SELECT F.sobre_nome, F.salario, D.departamento_nome, C.cargo_desc FROM funcionarios AS F
INNER JOIN departamentos AS D ON F.departamento_id = D.departamento_ID
INNER JOIN cargos AS C ON F.cargo = C.cargo_id
WHERE F.salario > 2900;
-- F
SELECT F.sobre_nome, F.cargo, D.departamento_nome FROM funcionarios AS F
INNER JOIN departamentos AS D ON F.departamento_id = D.departamento_id
INNER JOIN locais AS L ON D.local_id = L.local_id
WHERE L.cidade = 'Seattle';
-- G
SELECT D.departamento_nome, AVG(F.salario) FROM departamentos AS D
INNER JOIN funcionarios AS F ON D.departamento_id = F.departamento_id
GROUP BY D.departamento_nome;
-- H
SELECT D.departamento_nome, AVG(F.salario) FROM departamentos AS D
INNER JOIN funcionarios AS F ON D.departamento_id = F.departamento_id
GROUP BY D.departamento_nome
HAVING AVG(F.salario) BETWEEN 4000 AND 10000;

-- Exercícios de INNER JOIN parte 2
-- A
SELECT F.sobre_nome, D.departamento_nome FROM funcionarios AS F
INNER JOIN departamentos AS D ON F.departamento_id = D.departamento_id;

-- A(i) LEFT JOIN seleciona todas as linhas da tabela à esquerda (funcionarios) e seleciona apenas as linhas
-- importantes da tabela à direita
SELECT F.sobre_nome, D.departamento_nome FROM funcionarios AS F
LEFT JOIN departamentos AS D ON F.departamento_id = D.departamento_id
WHERE F.departamento_id IS NULL;
-- Aqui ele seleciona todas as linhas de funcionarios e seleciona apenas os departamentos que são iguais aos dos
-- funcionarios, na condição onde o departamento do funcionario seja NULL (nulo/inexistente)

-- A(ii) RIGHT JOIN seleciona todas as linhas da tabela à direita (departamentos) e seleciona apenas as
-- linhas importantes da tabela à esquerda
SELECT F.sobre_nome, D.departamento_nome FROM funcionarios AS F
RIGHT JOIN departamentos AS D ON F.departamento_id = D.departamento_id
WHERE F.sobre_nome IS NULL;
-- Aqui ele seleciona todas as linhas de departamentos e seleciona apenas os funcionarios que são iguais aos
-- dos departamentos, na condição onde o sobrenome do funcionario seja NULL (nulo/inexistente)

-- B
SELECT F.sobre_nome, C.cargo_desc FROM funcionarios AS F
INNER JOIN cargos AS C ON F.cargo = C.cargo_id;
-- B(i)
SELECT F.sobre_nome, C.cargo_desc FROM funcionarios AS F
LEFT JOIN cargos AS C ON F.cargo = C.cargo_id
WHERE C.cargo_desc IS NULL;
-- B(ii)
SELECT F.sobre_nome, C.cargo_desc FROM funcionarios AS F
RIGHT JOIN cargos AS C ON F.cargo = C.cargo_id
WHERE F.sobre_nome IS NULL;

-- C
SELECT P.pais_nome, L.cidade FROM paises AS P
INNER JOIN locais AS L ON P.pais_id = L.pais_id;
-- C(i)
SELECT P.pais_nome, L.cidade FROM paises AS P
LEFT JOIN locais AS L ON P.pais_id = L.pais_id
WHERE L.cidade IS NULL;

-- D
SELECT R.regiao_nome, P.pais_nome, L.local_id FROM regioes as R
INNER JOIN paises AS P ON R.regiao_id = P.regiao_id
INNER JOIN locais AS L ON P.pais_id = L.pais_id;
-- D(i)
SELECT R.regiao_id, P.pais_id, L.local_id FROM regioes as R
LEFT JOIN paises AS P ON R.regiao_id = P.regiao_id
LEFT JOIN locais AS L ON P.pais_id = L.pais_id;

-- View
-- A
CREATE VIEW func_vu AS
SELECT funcionario_id, sobre_nome AS FUNCIONARIO, departamento_id FROM funcionarios;

-- B
SELECT * FROM func_vu;

-- C
SELECT funcionario_id, FUNCIONARIO FROM func_vu WHERE departamento_id = 60;

-- D
SELECT FUNCIONARIO, departamento_id FROM func_vu WHERE FUNCIONARIO LIKE "%ON" AND departamento_id = 80;

-- E
CREATE VIEW ficha AS
SELECT F.pre_nome, F.sobre_nome, F.dt_admiss, F.salario, D.departamento_nome, L.cidade, P.pais_nome
FROM funcionarios AS F
INNER JOIN departamentos AS D ON F.departamento_id = D.departamento_id
INNER JOIN locais AS L ON D.local_id = L.local_id
INNER JOIN paises AS P ON L.pais_id = P.pais_id;

-- F
SELECT * FROM ficha;
DROP VIEW ficha;

-- G
CREATE INDEX IDXIDGER ON departamentos (gerente_id);

-- H
DROP INDEX IDXIDGER ON departamentos;

-- Subqueries

-- A
SELECT F.departamento_id, sobre_nome, cargo FROM funcionarios AS F, departamentos AS D
WHERE F.departamento_id = D.departamento_id
AND F.departamento_id IN
(SELECT departamento_id FROM departamentos WHERE departamento_nome = "executivo");

-- B
SELECT F.funcionario_id, F.sobre_nome, F.salario FROM funcionarios AS F
WHERE salario >
(SELECT AVG(F.salario) FROM funcionarios AS F);

-- C
SELECT F.sobre_nome, D.departamento_id, F.cargo FROM funcionarios AS F, departamentos AS D
WHERE F.departamento_id = D.departamento_id
AND D.local_id =
(SELECT L.local_id FROM locais AS L WHERE local_id = 1700);

-- D
SELECT F.sobre_nome, F.cargo FROM funcionarios AS F, departamentos AS D
WHERE F.departamento_id = D.departamento_id
AND D.local_id =
(SELECT L.local_id FROM locais AS L WHERE L.cidade = "Toronto");

-- E
SELECT F.sobre_nome, F.dt_admiss, F.salario FROM funcionarios AS F
JOIN departamentos AS D ON F.departamento_id = D.departamento_id
JOIN locais AS L ON D.local_id = L.local_id
JOIN paises AS P ON L.pais_id = P.pais_id
WHERE P.pais_id IN 
(SELECT P.pais_id FROM paises AS P WHERE P.pais_nome IN ("Canadá", "Estados Unidos")
AND Year(F.dt_admiss) = 1998);

-- Testes
SELECT F.sobre_nome, F.dt_admiss, F.salario, L.cidade, P.pais_nome
FROM funcionarios AS F, departamentos AS D, locais AS L, paises AS P
WHERE F.departamento_id = D.departamento_id && D.local_id = L.local_id && L.pais_id = P.pais_id
ORDER BY P.pais_nome;

-- Funções
-- A





