#!/usr/bin/ruby -w


=begin

Copyright (c) 2008 Rodrigo L. M. Flores - mail@rodrigoflores.org

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=end




=begin
http://br.spoj.pl/problems/DECADARI/
=end

require 'bigdecimal'

while horaPadrao = gets 
	if horaPadrao.nil?
		break
	end	
	#horaPadrao[0,2].split(/(./) =~ /(..)(..)(..)(..)/
	horas = BigDecimal(horaPadrao[0,2])
	minutos = BigDecimal(horaPadrao[2,2])
	segundos = BigDecimal(horaPadrao[4,2])
	centesimos = BigDecimal(horaPadrao[6,2])
	centesimos += 60*60*100*horas + 60*100*minutos + 100*segundos
	centesimosDecimais = centesimos*(100.0/86.4)
	printf "%07d\n", centesimosDecimais
end



