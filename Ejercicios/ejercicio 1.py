# Inicio del codigo
def fact(n):
    factorial_total = 1
    while n > 1:
        factorial_total *= n
        n -= 1
    return factorial_total
n=int(input("ingresa un numero  \n"))
x=1
x=fact(n)
print (x)
# Fin del codigo
