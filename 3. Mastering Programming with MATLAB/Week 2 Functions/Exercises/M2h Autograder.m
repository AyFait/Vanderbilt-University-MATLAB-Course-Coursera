%{
write a function called grader that tests two functions (one is supposed to be the student's solution and the other the reference solution provided by the instructor) by calling them repeatedly with various input arguments and comparing the results. 
For simplicity, we assume that both functions take exactly one input argument. 
The inputs to the grader function are two function handles followed by a variable number of additional input arguments. 
The function must call the two functions with each of the supplied input agruments one by one. 
If the results match for all test cases, that is, for each input argument, the grader function returns logical true. Otherwise, it returns false. 
Note that in order to ensure that the comparison works for arrays and not just scalars, you should use the isequal function as opposed to the == operator.
%}

function result = grader(student, reference, varargin)
%GRADER Compare a student's function against a reference function.
%   RESULT = GRADER(STUDENT,REFERENCE,X1,X2,...,XN) calls both functions
%   with each input Xi and returns true if all corresponding results
%   are equal.

result = true;

for k = 1:numel(varargin)
    studentResult = student(varargin{k});
    referenceResult = reference(varargin{k});

    if ~isequal(studentResult, referenceResult)
        result = false;
        return
    end
end
end
