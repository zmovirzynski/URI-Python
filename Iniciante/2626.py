# -*- coding: utf-8 -*-

venceDodo = "Os atributos dos monstros vao ser inteligencia, sabedoria..."
venceLeo    = "Iron Maiden's gonna get you, no matter how far!"
vencePepper = "Urano perdeu algo muito precioso..."
venceEmpate = "Putz vei, o Leo ta demorando muito pra jogar..."

while True:
    try:
      abc = input().split()
      a, b, c = abc
      dodo = str(a)
      leo = str(b)
      pepper = str(c)

      if dodo == "papel" and leo == "papel" and pepper == "tesoura":
        print(vencePepper)
      elif dodo == "papel" and leo == "pedra" and pepper == "pedra":
        print(venceDodo)
      elif dodo == "papel" and leo == "tesoura" and pepper == "papel":
        print(venceLeo)
      elif dodo == "pedra" and leo == "papel" and pepper == "pedra":
        print(venceLeo)
      elif dodo == "pedra" and leo == "pedra" and pepper == "papel":
        print(vencePepper)
      elif dodo == "pedra" and leo == "tesoura" and pepper == "tesoura":
        print(venceDodo)
      elif dodo == "tesoura" and leo == "papel" and pepper == "papel":
        print(venceDodo)
      elif dodo == "tesoura" and leo == "pedra" and pepper == "tesoura":
        print(venceLeo)
      elif dodo == "tesoura" and leo == "tesoura" and pepper == "pedra":
        print(vencePepper)
      else:
        print(venceEmpate)
    except EOFError:
        break