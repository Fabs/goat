#!/usr/bin/env ruby
# Example demonstrating "around" advice that traces calls to all methods in
# classes Foo and Bar

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

class Conta

  attr_accessor :saldo, :authorization,:nome
  
  def initialize(saldo,nome)
    @saldo = saldo
    @nome = nome
  end
  
  def is_valid?
    return @authorization
  end
  
  def muda_saldo(valor)
    @saldo += valor
  end

end
class Banco
  def transferencia(fonte,destino,valor)
    fonte.muda_saldo(-1*valor)
    destino.muda_saldo(valor)
  end
end

require 'aspects'

fabs = Conta.new(10,"fabs")
rafael = Conta.new(50,"rafael")
banco = Banco.new

banco.transferencia(rafael,fabs,100)
banco.transferencia(rafael,fabs,10)
banco.transferencia(rafael,fabs,-50)