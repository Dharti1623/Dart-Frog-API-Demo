import 'package:mysql_client/mysql_client.dart';

/// creating a database connection with MySQL
class MySQLClient {
  /// Returns a singleton
  factory MySQLClient() {
    return _inst;
  }

  MySQLClient._internal() {
    _connect();
  }

  static final MySQLClient _inst = MySQLClient._internal();

  MySQLConnection? _connection;

  /// initializes a connection to database
  Future<void> _connect() async {
    _connection = await MySQLConnection.createConnection(
      // "localhost" OR 127.0.0.1
      host: 'bupyxs0mnj0usjeiha4s-mysql.services.clever-cloud.com',
      // Your MySQL port
      port: 3306,
      // MySQL userName
      userName: 'uugedeyu0m2vv2be',
      // MySQL Database password
      password: '9lLT2TbfDG88tLPsBGBY',
      // your database name
      databaseName: 'bupyxs0mnj0usjeiha4s',
      // false - if your are not using SSL - otherwise it will through an error
      secure: false,
    );
    await _connection?.connect();
  }

  ///execute a given query and checks for db connection
  Future<IResultSet> execute(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    if (_connection == null || _connection?.connected == false) {
      await _connect();
    }

    if (_connection?.connected == false) {
      throw Exception('Could not connect to the database');
    }
    return _connection!.execute(query, params, iterable);
  }
}
