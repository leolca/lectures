def factorial(n):
    if n>1:
        F=n*factorial(n-1)
    else:
        F=1
    return F
