final createTable = '''
 CREATE TABLE user(
   id INTEGER NOT NULL PRIMARY KEY
   ,nome VARCHAR(200) NOT NULL
   ,telefone CHAR(16) NOT NULL
   ,email VARCHAR(150) NOT NULL
   ,senha VARCHAR(300)
   , perfil VARCHAR(300)
 )
''';

final createTableReminder = '''
 CREATE TABLE reminder(
   id INTEGER NOT NULL PRIMARY KEY
   ,titulo VARCHAR(200) NOT NULL
   ,descricao VARCHAR(200) NOT NULL
 )
''';

final createTableSleep = '''
 CREATE TABLE reminder(
   id INTEGER NOT NULL PRIMARY KEY
   ,DATE dataInicial NOT NULL
   ,DATE dataFinal
 )
''';

final insert1 = """
INSERT INTO user(nome,telefone,email,url_avatar)
VALUES('Pietro','(44) 999597866','pietro@gmail.com','123456', 'Administrador')
""";

final insert2 = """
INSERT INTO user(nome,telefone,email,url_avatar)
VALUES('Paula','(44) 999597866','pietro@gmail.com','654321', 'Usuario')
""";

final insert3 = """
INSERT INTO reminder(titulo,descricao)
VALUES('Tomar Remédio', 'Tomar remédio de insulina')
""";

final insert4 = """
INSERT INTO reminder(titulo,descricao)
VALUES('Beber Água', 'Tomar 2 vezes ao dia')
""";

final insert5 = """
INSERT INTO sleep(titulo,descricao)
VALUES('2020/03/20', '2020/03/20')
""";

final insert6 = """
INSERT INTO sleep(dataInicial,dataFinal)
VALUES('2021/06/20', '2021/06/20')
""";
