 %{
 Write a function called next_prime that takes a scalar positive integer input n. Use a while-loop to find and return k, the smallest prime number that is greater than n. Feel free to
se the built-in isprime function.
 %}

 function k = next_prime(n)
    % Initialize k to the first integer greater than n
    k = n + 1; 
    
    % Loop continues as long as k is NOT a prime number
    while ~isprime(k) 
        k = k + 1; 
    end
end
