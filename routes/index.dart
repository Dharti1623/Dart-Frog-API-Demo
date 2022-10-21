import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  const msg = 'Welcome to DART_FROG -------------- Please enter categories at route if you want list of categories-------------If you want to category by id then enter id after /categories';
  return Response.json(body: msg);
}