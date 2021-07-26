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

final insert1 = """
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Pietro','(44) 999597866','pietro@gmail.com','123456', 'Administrador')
""";

final insert2 = """
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Paula','(44) 999597866','pietro@gmail.com','654321', 'Usuario')
""";
