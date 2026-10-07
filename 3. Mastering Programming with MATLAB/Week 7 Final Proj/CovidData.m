classdef CovidData < handle
    % CovidData  Cumulative COVID-19 cases and deaths for one region.
    %
    % The same class is used at all three levels of the hierarchy:
    %   Global  -> Children are countries
    %   Country -> Children are states/provinces/territories (may be empty)
    %   State   -> no Children
    %
    % Build the whole hierarchy with:
    %   g = CovidData.buildGlobal(covid_data);   % covid_data = cell array from the .mat file

    properties (Constant)
        % Countries whose country-level row already equals the total of
        % their listed states. For every other country the listed states are
        % overseas territories that are NOT included in the country row.
        SubdividedCountries = ["Australia", "Canada", "China", "United States"];
    end

    properties
        Name  string = ""      % "Global", a country name, or a state name
        Dates datetime         % 1 x nDates
        Cases  double          % cumulative cases,  1 x nDates
        Deaths double          % cumulative deaths, 1 x nDates
        Children               % vector of CovidData (countries or states)
    end

    methods
        function obj = CovidData(name, dates, cases, deaths)
            obj.Children = CovidData.empty(1, 0);
            if nargin > 0
                obj.Name   = string(name);
                obj.Dates  = dates(:)';
                obj.Cases  = double(cases(:)');
                obj.Deaths = double(deaths(:)');
            end
        end

        function names = childNames(obj)
            % Names of the children as a string column vector.
            if isempty(obj.Children)
                names = strings(0, 1);
            else
                names = string({obj.Children.Name})';
            end
        end

        function child = findChild(obj, name)
            % Return the child with the given name ([] if there is none).
            idx = find(obj.childNames() == string(name), 1);
            if isempty(idx)
                child = CovidData.empty(1, 0);
            else
                child = obj.Children(idx);
            end
        end

        function y = series(obj, kind, isDaily, n)
            % series  Time series ready for plotting.
            %   kind    : "cases" or "deaths"
            %   isDaily : false -> cumulative, true -> daily numbers
            %   n       : moving-average length (1 = no averaging); uses the
            %             current day and the previous n-1 days.
            switch lower(string(kind))
                case "cases",  x = obj.Cases;
                case "deaths", x = obj.Deaths;
                otherwise, error("kind must be ""cases"" or ""deaths"".");
            end
            if isDaily
                x = diff([0, x]);
                x = max(x, 0);          % data corrections: never negative
            end
            n = round(n);
            if n > 1
                x = movmean(x, [n - 1, 0], 'Endpoints', 'shrink');
            end
            y = x;
        end
    end

    methods (Static)
        function g = buildGlobal(data)
            % buildGlobal  Convert the covid_data cell array to the object hierarchy.
            %   Row 1 : 'Country', 'State', then one date string per column.
            %   Rows 2+: country, state ('' for country rows), then [cases deaths]
            %            (cumulative) for every date. Entries may be stored as
            %            uint8/uint16/int32, so everything is converted to double.
            dates = datetime(string(data(1, 3:end)), 'InputFormat', 'M/d/yy');
            nd    = numel(dates);
            body  = data(2:end, :);

            vals   = cell2mat(cellfun(@(v) double(v(:)'), body(:, 3:end), ...
                                      'UniformOutput', false));   % nRows x 2*nd
            cases  = vals(:, 1:2:end);
            deaths = vals(:, 2:2:end);

            cNames = strtrim(string(body(:, 1)));
            sNames = strtrim(string(body(:, 2)));

            g = CovidData("Global", dates, zeros(1, nd), zeros(1, nd));

            for cn = unique(cNames, 'stable')'
                rows    = find(cNames == cn);
                topRow  = rows(sNames(rows) == "");
                stRows  = rows(sNames(rows) ~= "");
                stCases  = sum(cases(stRows, :), 1);   % zeros if no states
                stDeaths = sum(deaths(stRows, :), 1);

                if isempty(topRow)                      % no country-level row
                    tc = stCases;  td = stDeaths;
                else
                    tc = cases(topRow(1), :);  td = deaths(topRow(1), :);
                end

                country = CovidData(cn, dates, tc, td);
                for r = stRows'
                    country.Children(end+1) = ...
                        CovidData(sNames(r), dates, cases(r, :), deaths(r, :));
                end
                g.Children(end+1) = country;

                % Global total = every country row + territories that are not
                % already inside their country's row.
                g.Cases  = g.Cases  + tc;
                g.Deaths = g.Deaths + td;
                if ~isempty(topRow) && ~ismember(cn, CovidData.SubdividedCountries)
                    g.Cases  = g.Cases  + stCases;
                    g.Deaths = g.Deaths + stDeaths;
                end
            end
        end
    end
end
