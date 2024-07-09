#mixer_x(6) # = sum_i X_i

#mixer_x(6, [2,3]) # = sum_{i<j} X_i X_j + sum_{i<j<k} X_i X_j X_k

mixer_x(6,[1]) + 0.2*mixer_x(6,[2]) + mixer_x(6, [5])/π