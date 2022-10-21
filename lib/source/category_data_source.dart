import 'package:new_frog_demo_api/database/model.dart';
import 'package:new_frog_demo_api/database/sql_client.dart';

/// data source form MySQL

class DataSource {
  /// initializing
  const DataSource(
    this.sqlClient,
  );

  ///Fetches all table fields from users table in our database
  Future<List<DatabaseModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery = 'SELECT * FROM categories;';
    // executing our sqlQuery
    final result = await sqlClient.execute(sqlQuery);
    // a list to save our users from the table -
    // i mean whatever as many as user we get from table

    final categories = <DatabaseModel>[];
    for (final row in result.rows) {
      categories.add(DatabaseModel.fromRowAssoc(row.assoc()));
    }
    // simply returning the whatever the the users
    // we will get from the MySQL database
    return categories;
  }
  Future<List<DatabaseModel>> fetchCategory(String id) async {
    final sqlQuery = 'SELECT * FROM categories WHERE id=$id;';
    final result = await sqlClient.execute(sqlQuery);
    final category = <DatabaseModel>[];
    for (final row in result.rows) {
      category.add(DatabaseModel.fromRowAssoc(row.assoc()));
    }
    return category;
  }

  Future<List<DatabaseModel>> deleteCategory(String id) async {
    // sqlQuey
    final sqlQuery = 'DELETE FROM categories WHERE id=$id;';
    // executing our sqlQuery
    final result = await sqlClient.execute(sqlQuery);
    // a list to save our users from the table -
    // i mean whatever as many as user we get from table
    final category = <DatabaseModel>[];
    for (final row in result.rows) {
      category.add(DatabaseModel.fromRowAssoc(row.assoc()));
    }
    // simply returning the whatever the the users
    // we will get from the MySQL database
    return category;
  }

  Future<String> insertCategory(List keys, List values) async {
    final sqlQuery = 'INSERT INTO categories (${keys.join(",")}) VALUES ("${values.join(",")}")';
    await sqlClient.execute(sqlQuery);
    return 'Inserted successfully';
  }
  Future<String> updateCategory(List values,String id) async {
    final sqlQuery = 'UPDATE categories SET ${values.join(",").toString()} WHERE id= $id;';
    await sqlClient.execute(sqlQuery);
    return 'Updated successfully';
  }


  /// accessing you client
  final MySQLClient sqlClient;
}
