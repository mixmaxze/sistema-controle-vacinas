# Instruções de uso

### Como instalar o Haskell no Windows: https://www.haskell.org/platform/windows.html

### Para instalar no Ubuntu, basta digitar no terminal o seguinte comando:
```
sudo apt-get install haskell-platform
```

### Após isso, pode ser necessário instalar os pacotes não nativos strict e split com os comandos no terminal:

```
cabal install strict
cabal install split
```

Para rodar o programa, entre na pasta Haskell pelo terminal e então digite:
```
ghci main.hs
```

Depois, dentro do próprio ghci, digite:
```
main
```

Com isso o menu principal será aberto, dando acesso às operações do sistema.
