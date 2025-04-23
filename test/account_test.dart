import 'package:anybank/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Account account;

  setUp(() {
    account = Account(id: 123, name: "Beto", cpf: "123.123.123-22", balance: 100);
  });
  group("Testes de transferência", (){
    test("Testa uma transferência", (){
      account.transfer(100);

      expect(account.balance, 0);
    });
    test("Transfere valores negativos", (){
      account.transfer(-100);

      expect(account.balance, 100);
    });
    test("Transfere qualquer coisa que não seja números", (){
    });
    test("Transfere valor maior que disponível no balanço", (){
      account.transfer(101);

      expect(account.balance, 100);

    });
    test("Transfere 0", (){
      account.transfer(0);

      expect(account.balance, 100);
    });
    test("Transfere um valor nulo", (){
      account.transfer(null);

      expect(account.balance, 100);
    });
  });
}