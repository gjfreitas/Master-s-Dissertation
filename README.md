
Title: Automated approaches for the selection of the ARMA model order

Keywords: ARMA, ACF, PACF, Order selection Box-Jenkins, Hyndman-Khandakar algorithm, LSTM

Abstract:

Time series modeling using the ARMA class of models has long been a cornerstone in data analysis, yet the challenge of selecting the appropriate model order remains a critical issue. The traditional Box-Jenkins approach for the choice of model order can be subjective and time-consuming due to its manual processes, while also requiring expertise knowledge. This work aims to evaluate and develop automated approaches that can streamline the ARMA modeling process.
The work begins by taking an in-depth performance examination of the widely used Hyndman-Khandakar algorithm (HK). The results revealed that its performance is dependent on the length of the time series and the value of the (true) model parameters. Furthermore, the probability of the algorithm guessing the correct order converges, as the length of the time series increases, to a limiting value that depends on the value of these model parameters. Building upon this, an enhanced version of the algorithm is proposed, consisting of a post-processing step that analyzes the significance of the AR and MA coefficients of the highest order and iteratively removes the non-significant ones. This modification demonstrated performance improvements and revealed that a new approach to order selection could lead to better results by incorporating decision rules based on significance beyond the information criterion.
Recognizing the increasing adoption of neural network-based methods in time series analysis, a novel approach is introduced to determine the optimal ARMA model order. Two naive LSTMs were developed, considering different training data: either the time series (TS-LSTM) or the sample ACF and PACF (AP-LSTM), with the latter drawing inspiration from the Box-Jenkins approach. The poor performance of the TS-LSTM led to its discard, while the ability of the AP-LSTM to outperform the HK and its improved version in both execution time and accuracy prompted improvements in the model's architecture. The final AP-LSTM model achieved a $23\%$ and $18\%$ increase in accuracy compared to the HK and its improved version, respectively, while also being much faster.\\
In conclusion, this work provides insights into the strengths and weaknesses of the HK, proposes an improved version of this algorithm, and provides a ready-to-use LSTM-based model that may ease the need for an iterative process of fitting-evaluation, which helps streamline the process of selecting the optimal model order.


Contacts
For more information consult:

Gonçalo Freitas, Author of the dissertation, goncalojfreitas@ua.pt
Sónia Gouveia, PhD Researcher, Supervisor of the dissertation, sonia.gouveia@ua.pt.
