CREATE DATABASE BD1;
USE BD1;

CREATE TABLE departamentos
    ( departamento_id    integer primary key,
      departamento_nome  varchar(30),
      gerente_id         integer,
      local_id           integer
    );


CREATE TABLE funcionarios
    ( funcionario_id     integer primary key,
      pre_nome           varchar(20),
      sobre_nome         varchar(25),
      email              varchar(25),
      fone               varchar(20),
      dt_admiss          DATE,
      cargo              varchar(10),
      salario            float,
      pc_comiss          float,
      gerente_id         integer,
      departamento_id    integer
    ) ;

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
