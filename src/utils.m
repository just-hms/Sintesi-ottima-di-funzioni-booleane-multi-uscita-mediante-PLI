classdef utils
   
    methods (Static)
        
        function res = merge_sorted(array_1,array_2)
            
            % given
            %   two sorted arrays
            % returns
            %   a sorted array
            
            i_1 = 1;
            i_2 = 1;
            total_length = length(array_1) + length(array_2);
            res = zeros(1, total_length);
            
            for i = 1: total_length
                
                if i_1 > length(array_1)
                    res(i) = array_2(i_2);
                    i_2 = i_2 + 1;
                    continue
                end
                
                if i_2 > length(array_2)
                    res(i) = array_1(i_1);
                    i_1 = i_1 + 1;
                    continue
                end
                
                if array_1(i_1) < array_2(i_2)
                    res(i) = array_1(i_1);
                    i_1 = i_1 + 1;
                else
                    res(i) = array_2(i_2);
                    i_2 = i_2 + 1;
                end
            end
        end

        function res = mergeStrings(first_string, second_string, substitute_char)
            
            % given
            %   first_string := string
            %   second_string := string
            %   substitute_char := character to insert when strings differ
            % returns
            %   res := merged string
        
            res = first_string;
        
            count = 0;
        
            for i = 1:length(first_string{1})
        
                f = first_string{1}(i);
                s = second_string{1}(i);
        
                if (f == substitute_char || s == substitute_char) && f ~= s
                    res = "";
                    return
                end
                
                if f ~= s
                    res{1}(i) = substitute_char;
                    count = count + 1;
                end 
        
                if count > 1
                    res = "";
                    return
                end
            end
        end

        function idx = findString(string_array, string)

            idx = -1;
        
            for i = 1:length(string_array)
                if strcmp(string_array(i, :), string)
                    idx = i;
                    return
                end
            end
            
        end

        function count = countChars(char_array, char_to_find)
            count = length(strfind(char_array, char_to_find));
        end

        function res = allCellsEmpty(cell_array)
        
            res = 1;
            for i = 1:length(cell_array)
                if ~ isempty(cell_array{i})
                    res = 0;
                    return
                end
            end
        end

        % https://uk.mathworks.com/help/matlab/matlab_prog/argument-validation-functions.html

        function mustBeInAscendingOrder(a)

            if utils.isInAscendingOrder(a) ; return ; end

            eidType = 'mustBeInAscendingOrder:notInAscendingOrder';
            msgType = 'Input must be in ascending order';
            throwAsCaller(MException(eidType,msgType))
        end

        function res = isInAscendingOrder(a)

            res = 1;
            last = 0;

            for i = a 

                if i <= last
                    res = 0;
                    return;
                end
                last = i;
            end

        end
   end
end