#!/bin/bash

# Chave desligada
chave=0
test $chave -eq 1 && echo LIGADA

# Chave ligada
chave=1
test $chave -eq 1 && echo LIGADA

# Chave desligada e robusta
chave=
test "$chave" = 1 && echo LIGADA

# Chave ligada e robusta
chave=1
test "$chave" = 1 && echo LIGADA	# quando usa-se "$chave" junto com =, qualquer valor diferente de 1 falha
