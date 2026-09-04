[emailValid, emailMsg] = validateRegistrationData('user@example.com', 'Password123!', 'username');
if ~emailValid
    disp(emailMsg);
else
    disp('Registration data is valid.');
end
