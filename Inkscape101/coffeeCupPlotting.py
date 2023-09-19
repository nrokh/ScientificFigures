import matplotlib.pyplot as plt
import numpy as np

# generate data (very experimental)
coffee_cups = np.arange(11)
goodness_NR = [0, 1, 2.5, 4, 4.5, 5, 5.5, 3, 1, 0, -3]
goodness_AS = [0, 0, 0, 0, 4, 5.5, 6.5, 8, 10, 10.5, 11]

# create plot
plt.figure()
plt.plot(coffee_cups, goodness_NR, '-o', label='Nataliya')
plt.plot(coffee_cups, goodness_AS, '-o', label='Andrew')
plt.plot([0, 10], [0, 0], '--k')  # base line of neutrality
plt.xlabel('Cups of Coffee (standard)')
plt.ylabel('How good I feel (normalized)')
plt.legend(loc='upper left')
plt.grid(True)
plt.box(True)


# Save the figure as an .svg file
plt.savefig('CoffeePlotPy.svg', format='svg')

plt.show()
