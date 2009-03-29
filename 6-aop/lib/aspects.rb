require 'rubygems'
require 'aquarium'

include Aquarium::DSL
include Aquarium::Aspects
Aspect.new :around, :calls_to => :transferencia, :on_types => [Banco] do |joint_point, object, fonte, destino, valor|
  if fonte.saldo > valor and valor > 0
    p "Tranferido #{valor} de #{fonte.nome} para #{destino.nome}."
    joint_point.proceed
  end
end

Aspect.new :after, :calls_to => :muda_saldo, :on_types => [Conta] do |joint_point, object, valor|
  p "#{object.nome} mudança de saldo de #{valor}"
end
