import numpy as np
import matplotlib.pyplot as plt
xi = np.array([[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25]])
yi = np.array([[2],[5],[7],[9],[11],[16],[19],[23],[22],[29],[29],[35],[37],[40],[46],[42],[39],[31],[30],[28],[20],[15],[10],[6]])
plt.plot(xi,yi,'ro')
#tạo thêm bình phương để cộng vào Xbar
x_square=np.array([xi[:,0]**2]).T
one=np.ones((xi.shape[0],1))
xi=np.concatenate((xi,x_square),axis=1)
Xbar=np.concatenate((one,xi),axis=1)

A=np.dot(Xbar.T,Xbar)
b=np.dot(Xbar.T,yi)
w=np.dot(np.linalg.pinv(A),b)
w_0 = w[0][0]
w_1 = w[1][0]
w_2 = w[2][0]
x0 = np.linspace(1, 25, 10000)
y0 = w_0 + w_1*x0 +w_2*x0*x0

plt.plot(x0, y0)               # the fitting line
plt.xlabel('Height (cm)')
plt.ylabel('Weight (kg)')
plt.show()