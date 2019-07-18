import matplotlib.pyplot as plt

X = [x for x in range(0,13)]

P_2 = [(2/6)/5, (2/6)/4, (2/6)/3, (2/6)/3,(2/6)/2, (2/6)/1, (2/6)/1,(2/6)/2,(2/6)/1,
	(2/6)/1,(2/6)/1,(2/6)/2,(2/6)/3]






data = [2,5,6,8,9,10]


plt.plot(X,P_2)
plt.plot(data, [0 for x in range(len(data))], 'bo',color='fuchsia')
plt.grid()
plt.xlim(0,12)
plt.ylim(0,0.7)
plt.ylabel("p(x)")
plt.xlabel("x")
plt.xticks(X)
plt.show()
