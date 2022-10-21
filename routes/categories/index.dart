import 'package:dart_frog/dart_frog.dart';
import 'package:new_frog_demo_api/source/category_data_source.dart';

Future<Response> onRequest(RequestContext context) async {
  // reading the context of our dataSource
  final dataRepository = context.read<DataSource>();
  final request = context.request;
  // than we will return the response as JSON
  // return Response.json(body: {'data' : categories});
  switch (request.method) {
    case HttpMethod.get:
      final categories = await dataRepository.fetchFields();
      return Response.json(body: {'data': categories});
      break;
    case HttpMethod.post:
      List keys = [];
      List values = [];
      final data = await context.request.json();
      data.forEach((key, value) {
        keys.add(key);
        values.add(value);
      });
      final result = await dataRepository.insertCategory(keys,values);
      return Response.json(body: {'message' : result});
      break;
    case HttpMethod.put:
      var msg = 'Please enter Id you want to update';
      return Response.json(body: {'error': msg});
      break;
    case HttpMethod.delete:
      var msg = 'Please enter Id you want to delete';
      return Response.json(body: {'error': msg});
      break;
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(body: {'message': 'Method not found'});
      break;

  }
}
